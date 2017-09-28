defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """
  @allletter 'abcdefghijklmnopqrstuvwxyz'

  @spec pangram?(String.t) :: boolean
  def pangram?(sentence) do
    sentence
    |> String.replace(~r/[^a-zA-Z]/, "")
    |> String.downcase
    |> to_charlist
    |> Enum.sort(&(&1 < &2))
    |> Enum.uniq
    == @allletter
  end
end
