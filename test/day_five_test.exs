defmodule DayFiveTest do
  use ExUnit.Case
  doctest DayFive

  test "Day 05 - for test input crates on top are CMZ" do
    assert File.read!("./inputs/day_five/test_input.txt")
     |> IO.inspect
     |> DayFive.get_crates_on_top() == "CMZ"
  end

#  test "Day 05 - get result for challenge input part 1" do
#    File.read!("./inputs/day_five/challenge_input.txt")
#    |> DayFive.get_inputs_fully_contain_the_other()
#    |> IO.inspect(label: "Day 05 - Part 01: result for challenge input part 1 is")
#  end
#
#
#  test "Day 05 Part 2 - for test input number of assignment pairs that overlap is 4" do
#    assert File.read!("./inputs/day_five/test_input.txt")
#           |> DayFivePart2.get_inputs_overlap() == 4
#  end
#
#  test "Day 05 part 2 - result for challenge input part 2" do
#    File.read!("./inputs/day_five/challenge_input.txt")
#    |> DayFivePart2.get_inputs_overlap()
#    |> IO.inspect(label: "Day 05 - Part 02: result for challenge input part 2 is")
#  end
end
