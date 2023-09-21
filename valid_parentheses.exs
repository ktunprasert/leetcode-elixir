valid = "()"
invalid = ")(()))"

defmodule Solution do
  def is_valid(s) do
    s
    |> String.to_charlist()
    |> Enum.reduce_while([], fn
      char, list ->
        case {List.last(list), char} do
          {?(, ?)} -> {:cont, List.delete_at(list, -1)}
          {?[, ?]} -> {:cont, List.delete_at(list, -1)}
          {?{, ?}} -> {:cont, List.delete_at(list, -1)}
          {nil, c} when c in [?), ?], ?}] -> {:halt, false}
          _ -> {:cont, list ++ [char]}
        end
    end)
    |> then(fn
      list when is_list(list) -> length(list) == 0
      bool -> bool
    end)
  end
end

defmodule SolutionRecursion do
  def is_valid(s) do
    check(s, [])
  end

  defp check("", []), do: true

  defp check("(" <> s, stack) do
    check(s, [")" | stack])
  end

  defp check("[" <> s, stack) do
    check(s, ["]" | stack])
  end

  defp check("{" <> s, stack) do
    check(s, ["}" | stack])
  end

  defp check(<<closing::utf8, s::binary>>, [<<opening::utf8>> | stack]) do
    check(s, stack)
  end

  defp check(_s, _stack), do: false
end

Solution.is_valid(valid) |> IO.inspect()
Solution.is_valid(invalid) |> IO.inspect()

SolutionRecursion.is_valid(valid) |> IO.inspect()
SolutionRecursion.is_valid(invalid) |> IO.inspect()
