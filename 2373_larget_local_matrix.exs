case1 = [[9, 9, 8, 1], [5, 6, 2, 6], [8, 2, 6, 4], [6, 2, 2, 2]]
case2 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

defmodule Solution do
  @spec largest_local(grid :: [[integer]]) :: [[integer]]
  def largest_local(grid) when length(grid) === 3 do
    [[grid |> List.flatten() |> Enum.max()]]
  end

  def largest_local(grid) do
    bound = length(grid) - 2

    for i <- 1..bound, j <- 1..bound do
      for x <- -1..1, y <- -1..1 do
        grid |> at([i + x, j + y])
      end
      |> Enum.max()
    end
    |> Enum.chunk_every(bound)
  end

  def at(grid, [i, j]), do: grid |> Enum.at(i) |> Enum.at(j)
end

Solution.largest_local(case1)
|> IO.inspect()
