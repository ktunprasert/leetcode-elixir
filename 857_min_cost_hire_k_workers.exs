cases = [
  {[10, 20, 5], [70, 50, 30], 2, 105.0},
  {[3, 1, 10, 10, 1], [4, 8, 2, 2, 7], 3, 30.66667},
  {[3, 4, 3], [13, 8, 20], 1, 8.00}
]

defmodule Solution do
  @spec mincost_to_hire_workers(quality :: [integer], wage :: [integer], k :: integer) :: float
  def mincost_to_hire_workers(_, wages, 1), do: Enum.min(wages)

  def mincost_to_hire_workers(quality, wage, k) do
    quality_wage = Enum.zip(quality, wage)

    Stream.repeatedly(fn -> quality_wage end)
    |> Stream.with_index()
    |> Stream.map(fn {lst, i} ->
      [{b_q, b_w} | rest] = lst |> Enum.slide(i, 0)

      total = b_w

      rest =
        Enum.map(rest, fn {quality, wage} ->
          {quality / b_q * b_w, wage}
        end)
        |> Enum.filter(fn {desired_wage, wage} -> wage <= desired_wage end)
        |> Enum.sort()

      if length(rest) == 0 || length(rest) < k - 1 do
        :not_found
      else
        rest
        |> Enum.take(k - 1)
        |> Enum.reduce(total, fn {wage_ratio, _}, acc -> acc + wage_ratio end)
      end
    end)
    |> Enum.take(length(quality))
    |> Enum.min()
  end
end

cases
|> Enum.each(fn {quality, wage, k, expected} ->
  out = Solution.mincost_to_hire_workers(quality, wage, k)

  {quality, wage, k, out, expected, out == expected}
  |> IO.inspect()
end)
