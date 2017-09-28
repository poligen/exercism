defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors_list = for n <-  1..(limit-1), is_factors(n, factors), do: n
    Enum.sum(factors_list)
  end


  defp is_factors(_number, []), do: false
  defp is_factors(number, [head | tail]) do
    if rem(number, head) == 0 do
      true
    else
      is_factors(number, tail)
    end
  end
end
