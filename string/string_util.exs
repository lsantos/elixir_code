defmodule StringUtil do

    def anagram(word1, word2)
    when is_list(word1) and is_list(word2) do
        word1
    	|> Enum.all?(&_contains?(word2, &1))    
    end
   
    defp _contains?(words, word), do: Enum.any?(words, &(&1 == word))
end

IO.puts StringUtil.anagram('cinema', 'iceman')

