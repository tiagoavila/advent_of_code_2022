defmodule DayTwoTest do
  use ExUnit.Case
  doctest DayTwo
  doctest DayTwoPartTwo

  test "Day 02 - for test input the total score is 15" do
    assert File.read!("./inputs/day_two/test_input.txt")
           |> DayTwo.get_total_score() == 15
  end

  test "Day 02 - get result for challenge input" do
    File.read!("./inputs/day_two/challenge_input.txt")
    |> DayTwo.get_total_score()
    |> IO.inspect(label: "Day 02 - Part 01: Total score for challenge input is")
  end

  test "Day 02 Part 02 - for test input the total score is 15" do
    assert File.read!("./inputs/day_two/test_input.txt")
           |> DayTwoPartTwo.get_total_score() == 12
  end

  test "Day 02 Part 02 - get result for challenge input" do
    File.read!("./inputs/day_two/challenge_input.txt")
    |> DayTwoPartTwo.get_total_score()
    |> IO.inspect(label: "Day 02 - Part 02: Total score for challenge input is")
  end

end
