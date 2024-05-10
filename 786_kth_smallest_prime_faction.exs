cases = [
  # input, k, expected
  {[1, 2, 3, 5], 3, [2, 5]},
  {[1, 7], 1, [1, 7]}
]

defmodule Solution do
  @spec kth_smallest_prime_fraction(arr :: [integer], k :: integer) :: [integer]
  def kth_smallest_prime_fraction([a, b], _), do: [a, b]

  def kth_smallest_prime_fraction(arr, k) do
    for i <- arr, j <- arr, i < j do
      [i, j]
    end
    |> Enum.sort(fn [a, b], [x, y] -> a / b <= x / y end)
    |> Enum.at(k - 1)
  end
end

cases
|> Enum.each(fn {input, k, expected} ->
  out = Solution.kth_smallest_prime_fraction(input, k)

  {input, k, out, out === expected}
  |> IO.inspect()
end)
