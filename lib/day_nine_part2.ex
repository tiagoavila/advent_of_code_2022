defmodule DayNinePart2 do
  import DayNine, only: [move_head: 2, move_tail: 2, parse_instructions: 1]

  @start_position {0, 4}

  defstruct head_position: {},
            tails_position: [],
            visited_positions: %MapSet{}

  def get_positions_tail_visited(input, start_position \\ @start_position) do
    tails = 1..9 |> Enum.map(fn _ -> start_position end)

    input
    |> parse_instructions
    |> Enum.reduce(
      %DayNinePart2{
        head_position: start_position,
        tails_position: tails,
        visited_positions: MapSet.new([start_position])
      },
      &process_instruction/2
    )
    |> then(fn %DayNinePart2{visited_positions: visited} -> MapSet.size(visited) end)
  end

  def process_instruction({dir, moves_number}, acc) do
    Enum.reduce(1..String.to_integer(moves_number), acc, fn _, acc ->
      head_position = move_head(dir, acc.head_position)

      {tails_updated, last_tail_position} =
        acc.tails_position
        |> Enum.map_reduce(head_position, fn {tx, ty}, {previous_x, previous_y} ->
          tail_position = move_tail({previous_x, previous_y}, {tx, ty})
          {tail_position, tail_position}
        end)

      %DayNinePart2{
        head_position: head_position,
        tails_position: tails_updated,
        visited_positions: MapSet.put(acc.visited_positions, last_tail_position)
      }
    end)
  end
end
