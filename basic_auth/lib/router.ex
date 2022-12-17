defmodule BasicAuth.Router do
  @moduledoc """
  Securing a page behind HTTP Basic auth
  """

  import Plug.BasicAuth

  use Plug.Router

  plug(:basic_auth, username: "hello", password: "secret")
  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, """
    <h1>Welcome</h1>
    """)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
