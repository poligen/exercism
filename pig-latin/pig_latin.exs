defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(&extract_word/1)
    |> Enum.join(" ")
  end

  defp extract_word("qu" <> rest), do: extract_word(rest <> "qu")

  defp extract_word(<<word::binary-2>> <> rest) when word in ~w(yt xr), do: word <> rest <>  "ay"

  defp extract_word(<<word::binary-1>> <> rest) when word in ~w(a e i o u) do
    word <> rest <> "ay"
  end

  defp extract_word(<<consonant::binary-1>> <> rest) do
    extract_word(rest <> consonant)
  end

end



