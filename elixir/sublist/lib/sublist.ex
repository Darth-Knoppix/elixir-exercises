defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  def compare(a, a), do: :equal
  def compare([], _), do: :sublist
  def compare(_, []), do: :superlist

  def compare(a, b) do
    a_count = Enum.count(a)
    b_count = Enum.count(b)
    b_chunk = Enum.take(b, a_count)

    cond do
      Enum.count(b_chunk) < b_count ->
        :unequal

      a_count !== b_count and a === b_chunk ->
        :sublist

      b_count === 1 and a !== b ->
        :unequal

      true ->
        [_ | b_rest] = b
        compare(a, b_rest)
    end
  end
end
