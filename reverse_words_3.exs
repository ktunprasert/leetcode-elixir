w = "Let's take LeetCode contest"

defmodule Solution do
  def reverse_words(string) do
    string
    |> String.split()
    |> Enum.map(&String.reverse/1)
    |> Enum.join(" ")
  end
end

w |> Solution.reverse_words() |> dbg
