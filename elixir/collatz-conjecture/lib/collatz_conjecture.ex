defmodule CollatzConjecture do
  require Integer

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input == 1 do
    0
  end

  def calc(input) when is_integer(input) and input > 0 do
    new_num =
      case Integer.is_odd(input) do
        true -> input * 3 + 1
        false -> div(input, 2)
      end

    1 + calc(new_num)
  end
end
