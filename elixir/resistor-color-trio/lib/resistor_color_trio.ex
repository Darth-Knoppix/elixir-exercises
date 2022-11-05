defmodule ResistorColorTrio do
  @spec code(atom) :: integer()
  def code(:black), do: 0
  def code(:brown), do: 1
  def code(:red), do: 2
  def code(:orange), do: 3
  def code(:yellow), do: 4
  def code(:green), do: 5
  def code(:blue), do: 6
  def code(:violet), do: 7
  def code(:grey), do: 8
  def code(:white), do: 9

  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label(colors) do
    {num_values, [zero]} = Enum.split(colors, Enum.count(colors) - 1)

    zero = code(zero)

    {num_of_zeroes, unit} =
      cond do
        zero == 0 ->
          {0, :ohms}

        zero < 2 ->
          {zero, :ohms}

        true ->
          {zero, :kiloohms}
      end

    zero_str =
      0..num_of_zeroes
      |> Enum.filter(fn i -> i > 0 end)
      |> Enum.map_join("", fn _ -> "0" end)

    value =
      num_values
      |> Enum.map_join("", &code/1)

    final_value =
      [value | [zero_str]]
      |> Enum.join("")
      |> String.to_integer()

    final_value = if unit == :ohms, do: final_value, else: div(final_value, 1000)

    {final_value, unit}
  end
end
