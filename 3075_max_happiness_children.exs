case1 = {[1, 2, 3], 2}
case2 = {[1, 1, 1, 1], 2}
case3 = {[2, 3, 4, 5], 1}

# expect 144
case4 = {[2, 83, 62], 3}

# expect 53
case5 = {[12, 1, 42], 3}

"""
42
11
0
-> 53

when any n is less than k then return sum of all happiness
when n is greater than or equal to k then return sum of k largest happiness
"""

"""
n1 = 0 (0)
n2 = 1 (1)
n3 = 3 (1, 2)
n4 = 6 (1, 2, 3)
n5 = 10 (1, 2, 3, 4)

n = sum of 1 to n
n = n * (n + 1) / 2
"""

defmodule Solution do
  @spec maximum_happiness_sum(happiness :: [integer], k :: integer) :: integer
  def maximum_happiness_sum(happiness, k) do
    happiness
    |> Enum.sort(&>=/2)
    |> Enum.take(k)
    |> Enum.reduce({0, 0}, fn n, {acc, dec} ->
      n = if n - dec <= 0, do: 0, else: n - dec
      {acc + n, dec + 1}
    end)
    |> elem(0)
  end

  def maximum_happiness_sum({h, k}) do
    maximum_happiness_sum(h, k)
  end
end

[
  case1,
  case2,
  case3,
  case4,
  case5
]
|> Enum.map(&Solution.maximum_happiness_sum/1)
|> dbg

# Solution.maximum_happiness_sum(case4)
# |> dbg
