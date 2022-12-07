defmodule DayOneTest do
  use ExUnit.Case
  doctest DayOne

  test "Day 01 - for test input the most calories is 24000" do
    assert File.read!("./inputs/day_one/test_input.txt")
    |> DayOne.get_most_calories() == 24000
  end

  test "Day 01 - get result for challenge input part 1" do
        File.read!("./inputs/day_one/challenge_input.txt")
        |> DayOne.get_most_calories()
        |> IO.inspect(label: "Day 02 - Part 01: result for challenge input part 1 is")
  end

  test "Day 01 - for test input the most calories of top 3 elves is 45000" do
    assert File.read!("./inputs/day_one/test_input.txt")
    |> DayOne.get_calories_of_top_3_elves() == 45000
  end

  test "Day 01 - et result for challenge input part 2" do
    File.read!("./inputs/day_one/challenge_input.txt")
    |> DayOne.get_calories_of_top_3_elves()
    |> IO.inspect(label: "Day 01 - Part 02: result for challenge input part 2 is")
  end
end
