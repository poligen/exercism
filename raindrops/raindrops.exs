defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    case list = prime_factor(number) do
      [] -> "#{number}"
      _ -> Enum.map(list, &(raindrop/1)) |> List.to_string
    end
  end

  defp prime_factor(1), do: []
  defp prime_factor(number) do
    Enum.filter([3, 5, 7], &(rem(number, &1) == 0))
  end

  defp raindrop(3), do: "Pling"
  defp raindrop(5), do: "Plang"
  defp raindrop(7), do: "Plong"
end
