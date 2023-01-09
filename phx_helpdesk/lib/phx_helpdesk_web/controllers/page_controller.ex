defmodule PhxHelpdeskWeb.PageController do
  use PhxHelpdeskWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
