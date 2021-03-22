defmodule Sum do
  def of(0), do: 0
  def of(n), do: n + of(n-1)

  @author "Seth"
  def get_author, do: IO.puts "By #{@author}"
end
