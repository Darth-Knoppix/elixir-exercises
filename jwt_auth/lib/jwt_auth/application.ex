defmodule JWTAuth.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    bandit_options = [
      port: 3000,
      transport_options: [
        certfile: Path.relative_to_cwd("config/cert.pem"),
        keyfile: Path.relative_to_cwd("config/cert.key")
      ]
    ]

    children = [
      {Bandit, plug: JWTAuth.Router, scheme: :https, options: bandit_options}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: JWTAuth.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
