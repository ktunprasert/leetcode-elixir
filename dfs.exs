graph =
  %{
    a: [:b, :g],
    b: [:c, :d, :e],
    c: [],
    d: [],
    e: [:f],
    f: [],
    g: [:h],
    i: []
  }

defmodule Solution do
  def dfs(graph, node) do
    do_dfs(graph, node, [])
    |> Enum.reverse()
  end

  def do_dfs(graph, node, visited) do
    Map.get(graph, node, [])
    |> Enum.reduce([node | visited], &do_dfs(graph, &1, &2))
  end
end

Solution.dfs(graph, :a)
