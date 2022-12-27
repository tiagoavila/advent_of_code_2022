defmodule DayEightPart2 do
  import DayEight, only: [parse_grid: 1]

  def get_highest_scenic_score(input) do
    input
    |> parse_grid()
  end
end
