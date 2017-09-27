defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(:earth, seconds), do: Float.round( seconds / 31_557_600 , 2)
  def age_on(:mercury, seconds), do: Float.round(age_on(:earth, seconds) / 0.2408467, 2)
  def age_on(:venus, seconds), do: Float.round(age_on(:earth, seconds) / 0.61519726, 2)
  def age_on(:mars, seconds), do: Float.round(age_on(:earth, seconds) / 1.8808158, 2)
  def age_on(:jupiter, seconds), do: Float.round(age_on(:earth, seconds) / 11.862615, 2)
  def age_on(:saturn, seconds), do: Float.round(age_on(:earth, seconds) / 29.447498, 2)
  def age_on(:uranus, seconds), do: Float.round(age_on(:earth, seconds) / 84.016846, 2)
  def age_on(:neptune, seconds), do: Float.round(age_on(:earth, seconds) / 164.79132, 2)

end
