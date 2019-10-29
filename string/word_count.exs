
defmodule WordCount do
    def count_occurrences(words, word), do: _count_occurrences(words, word, 0)

    defp _count_occurrences([ _ = word | tail ], word, count), do: _count_occurrences(tail, word, count+1)
    
    defp _count_occurrences([ _ | tail ], word, count), do: _count_occurrences(tail, word, count) 
    
    defp _count_occurrences(_, _, count), do: count
    
end

IO.inspect "Counting occurences for word #{WordCount.count_occurrences('aaaabcdbd', 'a')}"
