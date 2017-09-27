defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/\W/, trim: true)
    |> Enum.map(&operate_string/1)
    |> List.to_string
  end

  def operate_string(<<first::binary-1>> <> rest) do
    String.upcase(first) <> rest
    |> (&Regex.scan(~r/[A-Z]/, &1)).()
  end
end
