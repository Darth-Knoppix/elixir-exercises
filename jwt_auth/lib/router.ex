defmodule JWTAuth.Router do
  @moduledoc """
  Securing a page behind HTTP JWT auth
  """

  use Plug.Router
  import Plug.Conn

  plug(:match)
  plug(:dispatch)

  @key JOSE.JWK.from(%{"k" => "", "kty" => "oct"})

  @username "seth@example.com"
  @password "secret"

  get "/" do
    conn = fetch_cookies(conn)

    message =
      case validate_token(conn) do
        {true, %JOSE.JWT{fields: %{"username" => username}}, _} ->
          " - You're authed #{username}"

        _ ->
          " - please login"
      end

    send_resp(conn, 200, """
    <h1>Welcome #{message}</h1>
    <form action="/login" method="POST">
      <label>
        Username
        <input name="username" type="email">
      </label>
      <label>
        Password
        <input name="password" type="password">
      </label>
      <input type="submit">
    </form>
    """)
  end

  post "/login" do
    # Read the body for the form submission to pull out the username
    {:ok, body, conn} = read_body(conn)

    IO.inspect(Plug.Conn.Query.decode(body))

    %{"username" => username, "password" => password} = Plug.Conn.Query.decode(body)

    # Authenticate by checking the email matches "admin@example.com"
    case username == @username && password == @password do
      true ->
        token = generate_token(username)

        conn
        |> resp(:found, "")
        |> put_resp_cookie("token", token)
        |> put_resp_header("location", "/")

      false ->
        conn
        |> send_resp(403, "")
    end
  end

  match _ do
    send_resp(conn, 404, "oops")
  end

  defp generate_token(username) do
    @key
    |> JOSE.JWT.sign(%{"alg" => "HS256"}, %{"username" => username})
    |> JOSE.JWS.compact()
    |> elem(1)
  end

  defp validate_token(conn) do
    case conn.cookies do
      %{"token" => token} -> JOSE.JWT.verify_strict(@key, ["HS256"], token)
      _ -> {false, {}}
    end
  end
end
