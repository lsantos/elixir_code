
defmodule WordCount2 do
    def count_occurrences(words, word)
    when is_list(words) do
	words 
	      |> Enum.filter(&([&1] == word))
	      |> Enum.count		 
        end
end

IO.inspect "Counting occurences for word #{WordCount2.count_occurrences('aaaabcdbd', 'b')}"
