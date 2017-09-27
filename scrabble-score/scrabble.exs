defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(""), do: 0
  def score(word) do
    word
    |> String.downcase
    |> String.codepoints
    |> Enum.reduce(0, fn(x, acc) ->
      point(x) + acc
    end)
  end

  defp point(""), do: 0
  defp point(one) when one in ~w(a e i o u l n r s t), do: 1
  defp point(two) when two in ~w(d g), do: 2
  defp point(three) when three in ~w(b c m p), do: 3
  defp point(four) when four in ~w(f h v w y), do: 4
  defp point("k"), do: 5
  defp point(eight) when eight in ~w(j x), do: 8
  defp point(ten) when ten in ~w(q z), do: 10
  defp point(_), do: 0
end
