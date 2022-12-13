defmodule DaySevenTest do
  use ExUnit.Case
  doctest DaySeven

  test "Day 07 - for test input the sum of the total sizes of the directories is 95437" do
    assert File.read!("./inputs/day_seven/test_input.txt")
           |> DaySeven.get_total_size_of_directories_at_most_100k() == 95437
  end

  #  test "Day 07 - get result for challenge input part 1" do
  #    File.read!("./inputs/day_seven/challenge_input.txt")
  #    |> DaySeven.get_crates_on_top()
  #    |> IO.inspect(label: "Day 07 - Part 01: result for challenge input part 1 is")
  #  end
  #
  #
  #  test "Day 07 Part 2 - for test input crates on top are MCD" do
  #    assert File.read!("./inputs/day_seven/test_input.txt")
  #           |> DaySevenPart2.get_crates_on_top() == "MCD"
  #  end
  #
  #  test "Day 07 part 2 - result for challenge input part 2" do
  #    File.read!("./inputs/day_seven/challenge_input.txt")
  #    |> DaySevenPart2.get_crates_on_top()
  #    |> IO.inspect(label: "Day 07 - Part 02: result for challenge input part 2 is")
  #  end
end
