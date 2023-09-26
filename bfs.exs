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
  def bfs(graph, node) do
    do_bfs(graph, node, [node])
  end

  def do_bfs(graph, node, visited) do
    neighbours = Map.get(graph, node, [])
    Enum.reduce(neighbours, visited ++ neighbours, &do_bfs(graph, &1, &2))
  end
end

Solution.bfs(graph, :a) |> dbg
