defmodule ResistorColorTrio do
  @spec code(atom) :: integer()
  defp code(:black), do: 0
  defp code(:brown), do: 1
  defp code(:red), do: 2
  defp code(:orange), do: 3
  defp code(:yellow), do: 4
  defp code(:green), do: 5
  defp code(:blue), do: 6
  defp code(:violet), do: 7
  defp code(:grey), do: 8
  defp code(:white), do: 9

  @spec convert_with_unit(pos_integer()) :: {pos_integer(), :kiloohms | :ohms}
  defp convert_with_unit(value) when value > 1000, do: {div(value, 1000), :kiloohms}
  defp convert_with_unit(value), do: {value, :ohms}

  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label(colors) do
    {num_values, [zero]} =
      colors
      |> Enum.map(&code/1)
      |> Enum.split(Enum.count(colors) - 1)

    zero_str =
      0..zero
      |> Enum.drop(1)
      |> Enum.map_join("", fn _ -> "0" end)

    String.to_integer(Enum.join(num_values, "") <> zero_str)
    |> convert_with_unit()
  end
end
