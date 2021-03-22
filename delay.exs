defmodule Delay do
  def start, do: :timer.apply_after(1000, Delay, :done, [])
  def done, do: IO.puts("Done")
end
