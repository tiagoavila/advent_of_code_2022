defmodule DayOneTest do
  use ExUnit.Case
  doctest DayOne

  test "for test input the most calories is 24000" do
    assert File.read!("./inputs/day_one/test_input.txt")
    |> DayOne.get_most_calories() == 24000
  end

  test "get result for challenge input part 1" do
        File.read!("./inputs/day_one/challenge_input.txt")
        |> DayOne.get_most_calories()
        |> IO.inspect
  end

  test "for test input the most calories of top 3 elves is 45000" do
    assert File.read!("./inputs/day_one/test_input.txt")
    |> DayOne.get_calories_of_top_3_elves() == 45000
  end

  test "get result for challenge input part 2" do
    File.read!("./inputs/day_one/challenge_input.txt")
    |> DayOne.get_calories_of_top_3_elves()
    |> IO.inspect
  end
end
