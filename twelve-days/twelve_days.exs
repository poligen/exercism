defmodule TwelveDays do
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    first_line(number) <> ", " <> concat_phrase(number)
  end


  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    starting_verse..ending_verse
    |> Enum.map(&verse(&1) <> "\n")
    |> List.to_string
    |> String.trim
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing():: String.t()
  def sing do
    verses(1, 12)
  end

  defp first_line(number), do: "On the #{nth_day(number)} day of Christmas my true love gave to me"

  defp concat_phrase(1) do
    gift_day(1) |> String.slice(4..-1)
  end
  defp concat_phrase(number) do
    1..number
    |> Enum.map(&gift_day(&1))
    |> Enum.reverse
    |> List.to_string
  end

  defp nth_day(1), do: "first"
  defp nth_day(2), do: "second"
  defp nth_day(3), do: "third"
  defp nth_day(4), do: "fourth"
  defp nth_day(5), do: "fifth"
  defp nth_day(6), do: "sixth"
  defp nth_day(7), do: "seventh"
  defp nth_day(8), do: "eighth"
  defp nth_day(9), do: "ninth"
  defp nth_day(10), do: "tenth"
  defp nth_day(11), do: "eleventh"
  defp nth_day(12), do: "twelfth"

  defp gift_day(1), do: "and a Partridge in a Pear Tree."
  defp gift_day(2),do: "two Turtle Doves, "
  defp gift_day(3), do: "three French Hens, "
  defp gift_day(4), do: "four Calling Birds, "
  defp gift_day(5), do: "five Gold Rings, "
  defp gift_day(6), do: "six Geese-a-Laying, "
  defp gift_day(7), do: "seven Swans-a-Swimming, "
  defp gift_day(8), do:  "eight Maids-a-Milking, "
  defp gift_day(9), do: "nine Ladies Dancing, "
  defp gift_day(10), do: "ten Lords-a-Leaping, "
  defp gift_day(11), do: "eleven Pipers Piping, "
  defp gift_day(12), do: "twelve Drummers Drumming, "

end

