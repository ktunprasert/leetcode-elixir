cases = [
  # input, k, expected
  {[1, 2, 3, 5], 3, [2, 5]},
  {[1, 7], 1, [1, 7]},
  {[1, 3, 5, 7, 11, 23, 37], 3, [3, 37]}
]

defmodule Solution do
  @spec kth_smallest_prime_fraction(arr :: [integer], k :: integer) :: [integer]
  def kth_smallest_prime_fraction([a, b], _), do: [a, b]

  def kth_smallest_prime_fraction([a | rest], k) when k <= 2 do
    [a, rest |> Enum.reverse() |> Enum.at(k - 1)]
  end

  def kth_smallest_prime_fraction(arr, k) do
    for i <- arr, j <- arr, i < j do
      {i / j, [i, j]}
    end
    |> :orddict.from_list()
    |> Enum.at(k - 1)
    |> elem(1)
  end
end

cases
|> Enum.each(fn {input, k, expected} ->
  out = Solution.kth_smallest_prime_fraction(input, k)

  {input, k, out, expected, out === expected}
  |> IO.inspect()
end)
