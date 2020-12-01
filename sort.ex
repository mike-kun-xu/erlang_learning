defmodule Sort do
    def quicksort(list) when length(list) > 1 do
        pivot = hd(list)
        large_list = Enum.filter(list, fn x -> x > pivot end)
        small_list = Enum.filter(list, fn x -> x < pivot end)
        pivot_list = Enum.filter(list, fn x -> x == pivot end)
        List.flatten([Sort.quicksort(large_list), pivot_list, Sort.quicksort(small_list)])
    end
    def quicksort(list) when length(list) == 1 do list end    
    def quicksort(list) when length(list) == 0 do [] end
    
    def mergesort(list) when length(list) > 1 do
        l = Enum.take_every(list, 2)
        r = Enum.drop_every(list, 2)
        Sort.merge(Sort.mergesort(l),Sort.mergesort(r),[])
    end
    def mergesort(list) when length(list) == 1 do list end
    def mergesort(list) when length(list) == 0 do [] end

    def merge(l = [lh|lt], r = [rh|rt], c) when lh > rh do
        Sort.merge(lt, r, c ++ [lh])
    end
    def merge(l = [lh|lt], r = [rh|rt], c) do
        Sort.merge(l, rt, c ++ [rh])
    end
    def merge(l, [], c) do
        c ++ l
    end
    def merge([], r, c) do
        c ++ r
    end
end