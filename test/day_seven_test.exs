defmodule DaySevenTest do
  use ExUnit.Case
  doctest DaySeven

  test "Day 07 - for test input the sum of the total sizes of the directories is 95437" do
    assert File.read!("./inputs/day_seven/test_input.txt")
           |> DaySeven.find_sum_of_small_folders() == 95437
  end

  test "Day 07 - get result for challenge input part 1" do
    File.read!("./inputs/day_seven/challenge_input.txt")
    |> DaySeven.find_sum_of_small_folders()
    |> IO.inspect(label: "Day 07 - Part 01: result for challenge input part 1 is")
  end

  test "Day 07 Part 2 - for test input total size of that directory to be deleted is" do
    assert File.read!("./inputs/day_seven/test_input.txt")
           |> DaySeven.find_size_of_smallest_directory_to_delete() == 24_933_642
  end

  test "Day 07 part 2 - result for challenge input part 2" do
    File.read!("./inputs/day_seven/challenge_input.txt")
    |> DaySeven.find_size_of_smallest_directory_to_delete()
    |> IO.inspect(label: "Day 07 - Part 02: result for challenge input part 2 is")
  end
end
