defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a1, a2}, {b1, b2}) do
    cond do
      a2 == b2 and a1 + b1 == 0 ->
        {0, 1}

      true ->
        denominator = a2 * b2
        {a1 * b2 + b1 * a2, denominator}
    end
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a1, a2}, {a1, a2}), do: {0, 1}

  def subtract({a1, a2}, {b1, b2}) do
    denominator = a2 * b2
    {a1 * b2 - b1 * a2, denominator}
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, a2}, {1, 1}), do: {a1, a2}
  def multiply({_a1, _a2}, {0, 1}), do: {0, 1}

  def multiply({a1, a2}, {b1, b2}) do
    cond do
      a1 < 0 and b1 < 0 -> RationalNumbers.abs({a1 * a2, b1 * b2})
      true -> {a1 * a2, b1 * b2}
    end
    |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a, b}) do
    {Kernel.abs(a), Kernel.abs(b)} |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) do
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a, b}) when a == b, do: {1, 1}
  def reduce({0, _b}), do: {0, 1}
  def reduce({a, b}) when b < 0 and a > 0, do: reduce({-1 * a, -1 * b})

  def reduce({a, b}) do
    gcd = Integer.gcd(a, b)
    {div(a, gcd), div(b, gcd)}
  end
end
