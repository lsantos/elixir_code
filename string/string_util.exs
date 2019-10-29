defmodule StringUtil do

    def anagram(word1, word2)
    when is_list(word1) and is_list(word2) do
        word1
        |> Enum.map(&_contains?(word2, &1))
    	|> Enum.all?    
    end
   
    defp _contains?(words, word), do: Enum.any?(words, &(&1 == word))
end

IO.puts StringUtil.anagram('cinema', 'iceman')

