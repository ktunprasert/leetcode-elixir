problems = [
  {8, 6},
  {1, 1},
  {4, -1}
]

defmodule Solution do
  @spec pivot_integer(n :: integer) :: integer
  def pivot_integer(1), do: 1

  def pivot_integer(n) do
    (n - 1)..1
    |> Stream.map(fn x ->
      {
        x + 1,
        1..(x + 1) |> sum(),
        (x + 1)..n |> sum()
      }
    end)
    |> Enum.find_value(-1, fn
      {x, same, same} -> x
      _ -> nil
    end)
  end

  def sum(a..b) do
    ((b - a + 1) * (a + b))
    |> div(2)
  end
end

Solution.pivot_integer(8)
|> dbg
