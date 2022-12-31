defmodule DayNineTest do
  use ExUnit.Case
  doctest DayNine

  test "Day 09 - for test input the number of positions the tail of the rope visits at least once is 13" do
    assert File.read!("./inputs/day_nine/test_input.txt")
           |> DayNine.get_positions_tail_visited() == 13
  end

  #  test "Day 09 - get result for challenge input part 1" do
  #    File.read!("./inputs/day_nine/challenge_input.txt")
  #    |> DayNine.get_number_of_visible_trees()
  #    |> IO.inspect(label: "Day 09 - Part 01: result for challenge input part 1 is")
  #  end

#  test "Day 09 Part 2 - for test input highest scenic score is 8" do
#    assert File.read!("./inputs/day_nine/test_input.txt")
#           |> DayNinePart2.get_highest_scenic_score() == 8
#  end
#
#  test "Day 09 part 2 - result for challenge input part 2" do
#    File.read!("./inputs/day_nine/challenge_input.txt")
#    |> DayNinePart2.get_highest_scenic_score()
#    |> IO.inspect(label: "Day 09 - Part 02: result for challenge input part 2 is")
#  end
end
