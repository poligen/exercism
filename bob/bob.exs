defmodule Bob do
  def hey(input) do
    cond do
      input |> String.trim |> String.length == 0 -> "Fine. Be that way!"
      String.last(input) == "?" -> "Sure."
      String.downcase(input) != input && String.upcase(input) == input -> "Whoa, chill out!"
      true -> "Whatever."

    end
  end

end
