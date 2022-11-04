defmodule CollatzConjecture do
  require Integer

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when input == 1 do
    0
  end

  def calc(input) do
    calc_step(input, 1)
  end

  @spec calc_step(input :: pos_integer(), iteration :: non_neg_integer()) :: non_neg_integer()
  def calc_step(input, _iteration) when input == 1 do
    1
  end

  def calc_step(input, iteration) do
    new_num =
      case Integer.is_odd(input) do
        true -> 1 + input * 3
        false -> input / 2
      end

    calc_step(new_num, iteration + 1)
  end
end
