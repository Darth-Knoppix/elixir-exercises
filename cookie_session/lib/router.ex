defmodule CookieSession.Router do
  @moduledoc """
  Securing a page behind cookied auth
  """

  use Plug.Router
  alias Plug.Conn.Query
  alias Plug.Conn

  plug(:put_secret_key_base)

  def put_secret_key_base(conn, _) do
    put_in(
      conn.secret_key_base,
      "vriWGOr7mQUzfAB4An2H3rWf5DWrOLkuaYRPKvXwwtbHkhJgVLQc9TMv7esdmnuT"
    )
  end

  plug(Plug.Session,
    store: :cookie,
    key: "_my_app_session",
    encryption_salt: "cookie store encryption salt",
    signing_salt: "cookie store signing salt",
    key_length: 64,
    log: :debug
  )

  plug(:match)
  plug(:dispatch)

  @token "atoken"

  get "/" do
    conn = Conn.fetch_session(conn)

    stored_value = Conn.get_session(conn, "value")

    send_resp(conn, 200, """
    <h1>Try access the page</h1>
    <a href="/restricted">This is a restricted page</a>
    <p>Submit a value to be stored in cookies</p>
    <form action="/store" method="POST">
      <label>
        Value
        <input name="value" type="text">
      </label>
      <input type="submit">
    </form>
    <output>#{stored_value}</output>
    """)
  end

  post "/store" do
    conn = Conn.fetch_session(conn)
    {:ok, body, conn} = Plug.Conn.read_body(conn)

    %{"value" => value} = Query.decode(body)

    conn
    |> Conn.put_session("value", value)
    |> Conn.resp(:found, "")
    |> Conn.put_resp_header("location", "/")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
