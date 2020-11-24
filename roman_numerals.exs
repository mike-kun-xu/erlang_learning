defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) when number > 0 and is_integer(number) do
  output = "" 
  result = RomanNumerals.numeral(number,output)
  result
 end
  def numeral(number, output) when number / 10 < 1 do
  digit = case number do
  1 -> "I"
  2 -> "II"
  3 -> "III"
  4 -> "IV"
  5 -> "V"
  6 -> "VI"
  7 -> "VII"
  8 -> "VIII"
  9 -> "IX"
  0 -> ""
  end
  output = output <> digit 
  output
 end 
  def numeral(number, output) when number / 10 >= 1 and number / 10 < 10 do
  ro_number = number - rem(number, 10)
  digit = case ro_number do
  10 -> "X"
  20 -> "XX"
  30 -> "XXX"
  40 -> "XL"
  50 -> "L"
  60 -> "LX"
  70 -> "LXX"
  80 -> "LXXX"
  90 -> "XC"
  end
  output = output <> digit 
  RomanNumerals.numeral(rem(number, 10), output)
 end
  def numeral(number, output) when number / 100 >= 1 and number / 100 < 10 do
  ro_number = number - rem(number, 100) 
  digit = case ro_number do
  100 -> "C"
  200 -> "CC"
  300 -> "CCC"
  400 -> "CD"
  500 -> "D"
  600 -> "DC"
  700 -> "DCC"
  800 -> "DCCC"
  900 -> "CM"
  end
  output = output <> digit
  RomanNumerals.numeral(rem(number, 100), output)
 end
  def numeral(number, output) when number / 1000 >= 1 and number / 1000 < 10 do
  ro_number = number - rem(number, 1000) 
  digit = case ro_number do
  1000 -> "M"
  2000 -> "MM"
  3000 -> "MMM"
  4000 -> "MMMM"
  end
  output = output <> digit
  RomanNumerals.numeral(rem(number, 1000), output)
 end
end
