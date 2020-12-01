defmodule Sort do
    def quicksort(list) do
    cond do
        length(list) > 1 ->
        pivot = hd(list)
        large_list = Enum.filter(list, fn x -> x > pivot end)
        small_list = Enum.filter(list, fn x -> x < pivot end)
        pivot_list = Enum.filter(list, fn x -> x == pivot end)
        List.flatten([Sort.quicksort(large_list), pivot_list, Sort.quicksort(small_list)])
        length(list) == 1 -> list
        Enum.empty?(list) -> []
    end
    end

    def mergesort(list) when length(list) > 1 do
        l = Enum.take_every(list, 2)
        r = Enum.drop_every(list, 2)
        Sort.merge(Sort.mergesort(l),Sort.mergesort(r),[])
    end
    def mergesort(list) when length(list) == 1 do list end
    def mergesort(list) when length(list) == 0 do [] end

    def merge(l, r, c) when length(l) >= 1 and length(r) >= 1 do
        if hd(l) > hd(r) do 
            Sort.merge(tl(l), r, c ++ [hd(l)])
        else
            Sort.merge(l, tl(r), c ++ [hd(r)])
        end
    end
    def merge(l, [], c) do
        c ++ l
    end
    def merge([], r, c) do
        c ++ r
    end
end