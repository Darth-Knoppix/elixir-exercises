defmodule CookieAuth.Router do
  @moduledoc """
  Securing a page behind cookied auth
  """

  use Plug.Router
  alias Plug.Conn

  plug(:put_secret_key_base)

  def put_secret_key_base(conn, _) do
    put_in(conn.secret_key_base, "-- PUT A VERY LONG STRING WITH AT LEAST 64 BYTES IN HERE --")
  end

  plug(:match)
  plug(:dispatch)

  @token "atoken"

  get "/" do
    send_resp(conn, 200, """
    <h1>Try access the page</h1>
    <a href="/restricted">This is a restricted page</a>
    <p>Login with <code><anything>@example.com</code> to see the restricted page</p>
    <form action="/login" method="POST">
      <label>
        Username
        <input name="username" type="email">
      </label>
      <input type="submit">
    </form>
    """)
  end

  post "/login" do
    # Read the body for the form submission to pull out the username
    {:ok, body, conn} = Conn.read_body(conn)
    %{"username" => username} = Plug.Conn.Query.decode(body)

    # Authenticate by checking the email ends with "admin@example.com"
    if String.ends_with?(username, "@example.com") do
      conn
      # Encrypted token cookie
      |> Conn.put_resp_cookie("session_token", @token, encrypt: true)
      # Signed email cookie
      |> Conn.put_resp_cookie("user", username, sign: true)
      |> Conn.resp(:found, "")
      |> Conn.put_resp_header("location", "/restricted")
    else
      conn
      |> send_resp(403, "")
    end
  end

  get "/restricted" do
    conn = Conn.fetch_cookies(conn, encrypted: ~w(session_token), signed: ~w(user))

    case conn.cookies do
      # Check the token matches
      %{"session_token" => @token, "user" => email} ->
        send_resp(conn, 200, """
        <h1>This is the restricted page, welcome "#{email}"</h1>
        """)

      # If there's no match, 403
      _ ->
        conn
        |> send_resp(403, "")
    end
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
