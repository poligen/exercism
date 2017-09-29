defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """

  @couple %{"{" => "}", "(" => ")", "[" => "]"}
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do str
    |> String.codepoints
    |> Enum.reduce([], fn(ch, acc)
    # add bracket to stack
    when ch in ["[", "{", "("] -> [ch | acc]
      # brackets match
      "]", ["[" | acc] -> acc
      "}", ["{" | acc] -> acc
      ")", ["(" | acc] -> acc
      # brackets do not match
      ch, _ when ch in ["]", "}", ")"] -> [false]
        _, acc -> acc
    end)
    |> Enum.empty?
  end

  # def check_brackets(str) do
  #   str
  #   |> String.graphemes
  #   |> matching?
  # end

  # defp matching?(list), do: matching?(list, [])
  # defp matching?([], acc), do: acc === []
  # defp matching?([open|tail], acc) when open in ["(", "[", "{"], do: matching?(tail, [open|acc])
  # defp matching?([")"|tail], ["("|acc]), do: matching?(tail, acc)
  # defp matching?(["]"|tail], ["["|acc]), do: matching?(tail, acc)
  # defp matching?(["}"|tail], ["{"|acc]), do: matching?(tail, acc)
  # defp matching?([close|_], _) when close in [")", "]", "}"], do: false
  # defp matching?([_|tail], acc), do: matching?(tail, acc)


end
