defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    word_list =
      sentence
      |> String.split(~r/[^-\p{L}\d]+/u, trim: true)
      |> Enum.map(&String.downcase/1)

    Map.new( word_list, fn(word) ->
      {word, count_word(word_list, word) }
    end)
  end

  defp count_word(list, current_word) do
    Enum.count(list, fn(word) -> word == current_word  end)
  end
end
