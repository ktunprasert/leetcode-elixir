n1 = [2, 7, 11, 15]
target1 = 9

n2 = [3, 3]
target2 = 6

defmodule Solution do
  def two_sum(nums, target) do
    Enum.reduce_while(nums, {%{}, 0}, fn num, {acc, index} ->
      diff = target - num
      index_of_diff = Map.get(acc, diff)

      if index_of_diff do
        {:halt, [index_of_diff, index]}
      else
        {:cont, {Map.put(acc, num, index), index + 1}}
      end
    end)
  end
end

Solution.two_sum(n1, target1) |> dbg
Solution.two_sum(n2, target2) |> dbg
