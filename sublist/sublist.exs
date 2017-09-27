defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      contains?(a, b) -> :superlist
      contains?(b, a) -> :sublist
      true -> :unequal
    end
  end

  defp contains?(list, sublist) do
    sub_count = length(sublist)
    list_count = length(list)

    cond do
      sub_count > list_count ->
        false
      Enum.take(list, sub_count) === sublist ->
        true
      true ->
        [_ | t] = list
        contains?(t, sublist)
    end
  end
end
