defmodule Player do
  defstruct [:x, :y]

  defimpl Kernel.Numeric, for: Player do
    def add(%Player{x: x1, y: y1}, %Player{x: x2, y: y2}) do
      %Player{x: x1 + x2, y: y1 + y2}
    end
  end
end

# defmodule Vector do
#   defstruct [:x, :y]
# end

# Usage:
# player = %Player{x: 1, y: 1}
# vector = %Vector{x: 0, y: 1}

# # Convert the vector to a player struct to use the overloaded + operator
# vector_as_player = %Player{x: vector.x, y: vector.y}

# new_player_position = player + vector_as_player

# IO.inspect(new_player_position)  # Output: %Player{x: 1, y: 2}
