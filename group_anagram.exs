strs = ["eat", "tea", "tan", "ate", "nat", "bat"]

defmodule Solution do
  def group_anagrams(strs) do
    strs
    |> Enum.group_by(&(&1 |> String.to_charlist() |> Enum.sort()))
    |> Map.values()
  end
end

Solution.group_anagrams(strs)
