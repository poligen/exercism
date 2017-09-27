defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist
    |> Enum.map(fn(t)->
      turn_into_cipher(t, shift)
    end)
    |> to_string
  end

  defp turn_into_cipher(t, shift) when t >= 65 and t <= 90 do
    rem(t + shift - 65, 26) + 65
  end
  defp turn_into_cipher(t, shift) when t >=97 and t<= 122 do
    rem(t + shift - 97, 26) + 97
  end
  defp turn_into_cipher(t, _), do: t

end


