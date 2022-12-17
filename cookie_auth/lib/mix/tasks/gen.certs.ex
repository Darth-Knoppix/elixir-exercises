defmodule Mix.Tasks.Gen.Certs do
  @moduledoc "Use openssl to generate self signed certificates for development"
  @shortdoc "Generate development certificates"

  use Mix.Task

  @impl Mix.Task
  def run(args) do
    if Mix.shell().yes?("Would you like to create new certificates?") do
      System.cmd(
        "mkcert",
        [
          "-cert-file",
          "config/cert.pem",
          "-key-file",
          "config/cert.key",
          "localhost"
        ]
      )
    end
  end
end
