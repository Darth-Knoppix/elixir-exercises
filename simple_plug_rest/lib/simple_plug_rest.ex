defmodule SimplePlugRest do
  @moduledoc """
  Documentation for `SimplePlugRest`.
  """
  import Plug.Conn

  def init(options) do
    options
  end

  @doc """
  Simple route for testing
  """
  @spec call(Plug.Conn.t(), any) :: Plug.Conn.t()
  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "hola")
  end
end
