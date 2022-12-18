defmodule CorsWeb.CORSPlug do
  import Plug.Conn

  def init(options), do: options

  def call(conn, opts) do
    origin =
      case get_req_header(conn, "origin") do
        [] -> ""
        [value] -> value
        _ -> ""
      end

    allow = origin == opts[:allow_site]

    %{method: method} = conn

    case {allow, method} do
      {true, _} ->
        conn
        # Only allow some sites to access the API
        |> put_resp_header("Access-Control-Allow-Origin", origin)
        # Our API only supports GET requests
        |> put_resp_header("Access-Control-Request-Method", "GET")

      _ ->
        conn
    end
  end
end
