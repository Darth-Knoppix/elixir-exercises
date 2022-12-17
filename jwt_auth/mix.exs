defmodule JWTAuth.MixProject do
  use Mix.Project

  def project do
    [
      app: :jwt_auth,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      xref: [exclude: [Plug.Builder]]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {JWTAuth.Application, []},
      applications: [:jose]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jose, "~> 1.11"},
      {:jason, "~> 1.4"},
      {:bandit, "~> 0.6.3"}
    ]
  end
end
