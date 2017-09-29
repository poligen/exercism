defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, &include?(base, &1))
  end

  defp include?(base, word) do
    rearrange(base) == rearrange(word) && String.downcase(base) != String.downcase(word)
  end

  defp rearrange(base) do
    base
    |> String.downcase
    |> to_charlist
    |> Enum.sort(&(&1 < &2))
  end

end
