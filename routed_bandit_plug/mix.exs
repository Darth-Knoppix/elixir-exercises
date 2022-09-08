defmodule RoutedBanditPlug.MixProject do
  use Mix.Project

  def project do
    [
      app: :routed_bandit_plug,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {RoutedBanditPlug.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bandit, "~> 0.4.7"}
    ]
  end
end
