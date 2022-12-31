defmodule DayNine do
  # == Initial State ==
  #   012345
  # 0 ......
  # 1 ......
  # 2 ......
  # 3 ......
  # 4 H.....  (H covers T, s)
  # s -> row: 4, column: 0
  @start_position {4, 0}

  defstruct head_position: @start_position, tail_position: @start_position, visited_positions: MapSet.new([@start_position])

  def get_positions_tail_visited(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&(&1 |> String.split(" ", trim: true) |> List.to_tuple()))
    |> Enum.reduce(%DayNine{}, &process_instruction/2)
  end

  defp process_instruction({dir, moves_number}, acc) do
    range = 1..String.to_integer(moves_number) |> IO.inspect

    acc

#    range
#    |> Enum.reduce
  end

#  defp process_instruction({"R", moves_number}, acc) do
#    moves_number
#    |> String.to_integer()
#  end
#
#  defp process_instruction({"U", moves_number}, acc) do
#    acc
#  end
#
#  defp process_instruction({"L", moves_number}, acc) do
#    acc
#  end
#
#  defp process_instruction({"D", moves_number}, acc) do
#    acc
#  end

  defp move_head() do

  end
end
