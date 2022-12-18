defmodule CorsWeb.CoffeeController do
  use CorsWeb, :controller

  def index(conn, _params) do
    json(conn, %{
      "Flat White" => "€3.00",
      "Espresso" => "€1.50"
    })
  end
end
