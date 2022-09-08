defmodule RoutedBanditPlug.Router do
  @moduledoc """
  Documentation for `RoutedBanditPlug`.
  """

  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Hello World")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
