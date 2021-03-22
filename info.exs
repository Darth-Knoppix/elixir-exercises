defmodule Info do
  def current_dir, do: System.fetch_env! "PWD"
end
