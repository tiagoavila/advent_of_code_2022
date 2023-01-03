defmodule DayTenTest do
  use ExUnit.Case
  doctest DayTen

  test "Day 10 - for test input the sum of these six signal strengths is 13140" do
    assert File.read!("./inputs/day_ten/test_input.txt")
           |> DayTen.get_signal_strengths_sum() == 13140
  end

  test "Day 10 - get result for challenge input part 1" do
    File.read!("./inputs/day_ten/challenge_input.txt")
    |> DayTen.get_signal_strengths_sum()
    |> IO.inspect(label: "Day 10 - Part 01: result for challenge input part 1 is")
  end

#  test "Day 10 Part 2 - for test input the number of positions the tail of the rope visits at least once is 1" do
#    assert File.read!("./inputs/day_ten/test_input.txt")
#           |> DayTenPart2.get_positions_tail_visited() == 1
#  end
#
#  test "Day 10 Part 2 - for test input 2 the number of positions the tail of the rope visits at least once is 36" do
#    assert File.read!("./inputs/day_ten/test_input2.txt")
#           |> DayTenPart2.get_positions_tail_visited({11, 15}) == 36
#  end
#
#  test "Day 10 part 2 - result for challenge input part 2" do
#    File.read!("./inputs/day_ten/challenge_input.txt")
#    |> DayTenPart2.get_positions_tail_visited()
#    |> IO.inspect(label: "Day 10 - Part 02: result for challenge input part 2 is")
#  end
end
