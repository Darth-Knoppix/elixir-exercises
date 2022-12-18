defmodule CorsWeb.Router do
  use CorsWeb, :router

  pipeline :api do
    plug CorsWeb.CORSPlug, allow_site: "http://localhost:5173"
    plug :accepts, ["json"]
  end

  scope "/api", CorsWeb do
    pipe_through :api

    get "/", CoffeeController, :index
  end
end
