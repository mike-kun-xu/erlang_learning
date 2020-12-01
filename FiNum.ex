defmodule FiNum do
  defp f(n,n,_,output) do
     output
  end
  defp f(n,0,_,_) do 
     f(n,1,0,1)
  end
  defp f(n,1,_,_) do 
    f(n,2,1,1)
  end
  defp f(n,current,last_result,current_result) do 
    f(n,current + 1,current_result,last_result + current_result)
  end
  def fi(n) when is_integer(n) and n >= 0 do 
    f(n,0,0,0)
  end
end
