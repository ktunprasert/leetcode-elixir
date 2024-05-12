nums = [4, 1, -1, 2, -1, 2, 3]
k = 2

defmodule Solution do
  def top_k_frequent(nums, k) when length(nums) === k, do: nums

  def top_k_frequent(nums, k) do
    nums
    |> Enum.frequencies()
    |> Enum.sort_by(fn {_, count} -> -count end)
    |> Enum.take(k)
    |> Enum.map(fn {n, _} -> n end)
    # |> Enum.uniq()
    # |> Enum.map(fn n ->
    #   count = Enum.count(nums, &(&1 == n))
    #   {-count, n}
    # end)
    # |> Enum.sort()
    # |> Enum.take(k)
    # |> Enum.flat_map(fn {_, v} -> [v] end)
  end
end

Solution.top_k_frequent(nums, k) |> IO.inspect()
