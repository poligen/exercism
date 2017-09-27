defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  - split the string into "AA", "BBB", "CCCC"
  - count each string return a keyword list [A:2, B:3, C:4]
  - turn into list then concat into string, remove all the 1 part
  """


  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(string) do
    string
    |> String.codepoints
    |> list_concat
    |> count_string
    |> List.to_string
  end

  defp list_concat([]), do: []
  defp list_concat( [single] ), do: [ single ]
  defp list_concat([first, second | tail]) do
    if String.contains?(first, second) do
      new = first <> second
      list_concat([ new | tail ])
    else
      [first | list_concat([second | tail])]
    end
  end

  defp count_string(string_list) do
    string_list
    |> Enum.map(fn(word) ->
      if String.length(word) == 1 do
        word
      else
        "#{String.length(word)}" <> String.first(word)
      end
    end)
  end


  @spec decode(String.t) :: String.t
  def decode(""), do: ""
  def decode(string) do
    number_list = Regex.scan(~r/\d*[A-Za-z\s]/, string) |> List.flatten
    number_list
    |> Enum.reduce("", fn(word, acc) ->
      acc <> String.duplicate(decode_to_string(word),
      decode_to_number(word)
    )
    end)
  end

  defp decode_to_number(string) do
    try do
      Regex.scan(~r/\d+/, string)
      |> List.flatten
      |> List.first
      |> String.to_integer
    rescue
      ArgumentError -> 1
    end
  end

  defp decode_to_string(string) do
    Regex.scan(~r/[a-zA-Z\s]/, string)
    |> List.flatten
    |> List.first
  end



end
