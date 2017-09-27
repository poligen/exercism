defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())

  def slices(_, size) when size <= 0, do: []
  def slices("", _), do: []
  def slices(string = <<first::utf8>> <> rest, size) do
    if size > String.length(string) do
      []
    else
      {head, _} = String.split_at(string, size)
      [head | slices(rest, size)]
    end
  end
end

