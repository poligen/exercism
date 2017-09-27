defmodule SecretHandshake do
  use Bitwise

  @reverse 0b00010000
  @actions [
    {0b0001, "wink"},
    {0b0010, "double blink"},
    {0b0100, "close your eyes"},
    {0b1000, "jump"},
  ]

  """
  pseudocode
  - input: number
  - output: list
  - data structure: list
  - algorithm:
    - input a number
    - check with the instruction using bitwise one by one
    - if 1, then keep this action
    -  reverse if the code &&& reverse > 0
    - return the list
  """

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    if ( code &&& @reverse ) > 0 do
      actions = Enum.reverse(@actions)
    else
      actions = @actions
    end

    Enum.map(actions, fn({bit, action}) ->
      if ( bit &&& code ) > 0 do
        action
      else
       nil
      end
    end) |> Enum.filter(fn(item) -> item != nil end )
  end

end

