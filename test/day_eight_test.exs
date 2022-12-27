defmodule DayEightTest do
  use ExUnit.Case
  doctest DayEight

  test "Day 08 - for test input the number of trees that are visible from outside the grid is 21" do
    assert File.read!("./inputs/day_eight/test_input.txt")
           |> DayEight.get_number_of_visible_trees() == 21
  end

  test "Day 08 - get result for challenge input part 1" do
    File.read!("./inputs/day_eight/challenge_input.txt")
    |> DayEight.get_number_of_visible_trees()
    |> IO.inspect(label: "Day 08 - Part 01: result for challenge input part 1 is")
  end

#  test "Day 08 Part 2 - for test input total size of that directory to be deleted is" do
#    assert File.read!("./inputs/day_eight/test_input.txt")
#           |> DayEight.find_size_of_smallest_directory_to_delete() == 24_933_642
#  end
#
#  test "Day 08 part 2 - result for challenge input part 2" do
#    File.read!("./inputs/day_eight/challenge_input.txt")
#    |> DayEight.find_size_of_smallest_directory_to_delete()
#    |> IO.inspect(label: "Day 08 - Part 02: result for challenge input part 2 is")
#  end
end
