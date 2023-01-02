defmodule DayNine do
  # == Initial State ==
  # ^
  # | 0 ......
  # | 1 ......
  # | 2 ......
  # | 3 ......
  # | 4 H.....  (H covers T, s)
  # y   012345
  #   x -------------->
  #
  # s -> x: 0, y: 4
  @start_position {0, 4}

  defstruct head_position: @start_position,
            tail_position: @start_position,
            visited_positions: MapSet.new([@start_position])

  def get_positions_tail_visited(input) do
    input
    |> parse_instructions()
    |> Enum.reduce(%DayNine{}, &process_instruction/2)
    |> then(fn %DayNine{visited_positions: visited} -> MapSet.size(visited) end)
  end

  def parse_instructions(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&(&1 |> String.split(" ", trim: true) |> List.to_tuple()))
  end

  def process_instruction({dir, moves_number}, acc) do
    Enum.reduce(1..String.to_integer(moves_number), acc, fn _, acc ->
      head_position = move_head(dir, acc.head_position)
      tail_position = move_tail(head_position, acc.tail_position)
      visited_positions = MapSet.put(acc.visited_positions, tail_position)

      %DayNine{
        head_position: head_position,
        tail_position: tail_position,
        visited_positions: visited_positions
      }
    end)
  end

  def move_head("R", {x, y}), do: {x + 1, y}
  def move_head("L", {x, y}), do: {x - 1, y}
  def move_head("U", {x, y}), do: {x, y + 1}
  def move_head("D", {x, y}), do: {x, y - 1}

  # Head and Tail at same position: do nothing
  def move_tail({x, y}, {x, y}), do: {x, y}

  # Head and Tail at adjacent positions: do nothing
  def move_tail({hx, hy}, {tx, ty}) when abs(hx - tx) <= 1 and abs(hy - ty) <= 1, do: {tx, ty}

  # Head and Tail at same col: move
  def move_tail({x, hy}, {x, ty}) when hy > ty, do: {x, ty + 1}
  def move_tail({x, hy}, {x, ty}) when hy < ty, do: {x, ty - 1}

  # Head and Tail at same row: move
  def move_tail({hx, y}, {tx, y}) when hx > tx, do: {tx + 1, y}
  def move_tail({hx, y}, {tx, y}) when hx < tx, do: {tx - 1, y}

  # Head and Tail at diagonal positions
  def move_tail({hx, hy}, {tx, ty}) do
    dx = if hx - tx > 0, do: 1, else: -1
    dy = if hy - ty > 0, do: 1, else: -1
    {tx + dx, ty + dy}
  end
end
