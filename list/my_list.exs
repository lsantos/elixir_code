
defmodule MyList do
    def square([]), do: []
    
    def square([ head | tail ]), do: [ head*head | square(tail) ]
    
    def add_1([]), do: []
    
    def add_1([ head | tail ]), do: [ head+1 | add_1(tail) ]
    
    def map([], _func), do: []
    
    def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]
    
    def mapsum(list, func), do: _mapsum(map(list, func))
    
    def reduce([], value, _) do
        value
    end
    
    def reduce([head | tail], value, func) do
        reduce(tail, func.(head, value), func)
    end
    
    def max(list), do: reduce(list, 0, &Kernel.max(&1,&2))
    
    def flatten(list) when is_list(list) do
        _flatten(list)
    end

    def span(from, to), do: _into(from, to, [])
    
    defp _into(from, to, list)
    when from <= to do
        _into(from+1, to, list ++ [from])
    end    
    
    defp _into(from, to, list) 
    when from > to do
        list
    end
    defp _mapsum([n]), do: n
    defp _mapsum([ head | tail ]), do: head + _mapsum(tail)
    defp _flatten([ head | tail ]), do: _flatten(head) ++ _flatten(tail)
    defp _flatten([]), do: []
    defp _flatten(head), do: [ head ]
end
    
IO.inspect MyList.span(1,10)
