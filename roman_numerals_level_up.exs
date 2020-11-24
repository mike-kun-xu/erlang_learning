defmodule Roman do
  @doc """
  updated version with some hints by others
  """

  def numeral(number) when is_integer(number) and number < 5000 do
  case number do
  num when num >= 1000 -> "M" <> numeral(num - 1000)
  num when num >= 900 -> "CM" <> numeral(num - 900)
  num when num >= 500 -> "D" <> numeral(num - 500)
  num when num >= 400 -> "CD" <> numeral(num - 400)
  num when num >= 100 -> "C" <> numeral(num - 100)
  num when num >= 90 -> "XC" <> numeral(num - 90)
  num when num >= 50 -> "L" <> numeral(num - 50)
  num when num >= 40 -> "XL" <> numeral(num - 40)
  num when num >= 10 -> "X" <> numeral(num - 10)
  num when num >= 9 -> "IX" <> numeral(num - 9)
  num when num >= 5 -> "V" <> numeral(num - 5)
  num when num >= 4 -> "IV" <> numeral(num - 4)
  num when num == 1 -> "I" <> numeral(num - 1)
  num when num == 0 -> ""
  
  end
 end 
end

