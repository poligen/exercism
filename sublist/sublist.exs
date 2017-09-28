defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  # Finished in 2.1 seconds (0.1s on load, 1.9s on tests)
  # * test huge sublist not in huge list (1302.2ms)
  # * test superlist early in huge list (215.3ms)
  # * test sublist early in huge list (212.6ms)
  # * test comparing massive equal lists (207.1ms)

  def compare(a, a), do: :equal
  def compare(a, b) when length(b) > length(a) do
    if contains?(b, a) do
      :sublist
    else
      :unequal
    end
  end
  def compare(a, b) when length(a) == length(b), do: :unequal
  def compare(a, b) do
    if contains?(a, b) do
      :superlist
    else
      :unequal
    end
  end

  defp contains?(list, sublist) when length(sublist) > length(list), do: false
  defp contains?([_ | tail ] = list, sublist) do
    sub_count = length(sublist)
    if Enum.take(list, sub_count) === sublist do
      true
    else
      contains?(tail, sublist)
    end
  end

end

