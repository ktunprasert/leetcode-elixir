numbers = [1, 2, 3, 4, 5, 1]

numbers
|> Enum.sort()
|> Stream.chunk_every(2, 1, :discard)
|> Enum.any?(fn [a, b] -> a == b end)
|> dbg
