defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    {num1, den1} = a
    {num2, den2} = b

    num = num1 * den2 + num2 * den1
    den = den1 * den2

    {num, den} |> turn_valid() |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({num1, den1}, {num2, den2}) do
    num = num1 * den2 - num2 * den1
    den = den1 * den2

    {num, den} |> turn_valid() |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({num1, den1}, {num2, den2}) do
    num = num1 * num2
    den = den1 * den2

    {num, den} |> turn_valid() |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({num1, den1}, {num2, den2}) do
    num = num1 * den2
    den = num2 * den1

    {num, den} |> turn_valid() |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({num, den}) do
    {Kernel.abs(num), Kernel.abs(den)} |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({num, den}, n) when n >= 0 do
    {num ** n, den ** n} |> turn_valid() |> reduce()
  end

  def pow_rational({num, den}, n) when n < 0 do
    m = Kernel.abs(n)

    {den ** m, num ** m} |> turn_valid()
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {num, den}) do
    x ** (num / den)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({num, den}) do
    gcd = Integer.gcd(num, den)

    reduced_num = (num / gcd) |> trunc()
    reduced_den = (den / gcd) |> trunc()

    {reduced_num, reduced_den} |> turn_valid()
  end

  @spec turn_valid(rational :: rational()) :: rational()
  defp turn_valid({num, den}) when den <= 0 do
    {num * -1, den * -1}
  end

  defp turn_valid(rational), do: rational
end
