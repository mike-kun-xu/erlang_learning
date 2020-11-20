defmodule WordCount do
  @doc """
  Count the number of words showing up in the sentence.
  Available for utf8.
  """
  def count(sentence) do
  string_list = sentence |> String.replace(~r"[_]/u"," ") |> String.replace(~r"[\p{P}\p{S}]", "") |> String.split()
  map = %{}
  WordCount.createMap(string_list,map)
  end
  def createMap(list,map) when list == [] do
  map
  end
  def createMap(list,map) do
  element = list |> List.first()
  value = Enum.count(list,fn x -> x == element end)
  new_map = Map.put(map,element,value)
  new_list = Enum.reject(list,fn x -> x == element end)
  WordCount.createMap(new_list,new_map)

  end
end
