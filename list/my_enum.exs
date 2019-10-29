
defmodule MyEnum do
    def each(enumerable, fun) when is_list(enumerable) do 
        _each(enumerable, fun)
    end
    
    def filter(enumerable, fun) when is_list(enumerable) do 
        _filter(enumerable, fun)
    end
    
    def all?(enumerable, fun) when is_list(enumerable) do 
        _all?(filter(enumerable, fun), fun)
    end
    
    def take(enumerable, amount) when is_list(enumerable) and is_integer(amount) do 
        _take(enumerable, amount)
    end
    
    defp _take([head | tail], amount) when amount > 0 do 
        [head | _take(tail, amount - 1)]
    end
    
    defp _take([ _ | tail], amount) when amount === 0 do 
        _take(tail, amount)
    end
    
    defp _take([], _), do: []
   
    defp _all?([], _), do: false
    
    defp _all?([_ | _], _), do: true
    
    defp _filter([head | tail], fun), do: if(fun.(head), do: [head | _filter(tail, fun)], else: _filter(tail, fun))
    
    defp _filter([], _), do: []
    
    defp _each([head | tail], fun), do: [ fun.(head) | _each(tail, fun) ]

    defp _each([], _), do: []
end

IO.inspect MyEnum.all?([1,2,3,4,5,6], &(&1 > 1))
