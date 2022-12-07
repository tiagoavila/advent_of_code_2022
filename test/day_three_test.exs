defmodule DayThreeTest do
  use ExUnit.Case
  doctest DayThree
  doctest DayThreePart2

  test "Day 03 - for test input sum of priorities is 157" do
    assert File.read!("./inputs/day_three/test_input.txt")
           |> DayThree.get_sum_priorities() == 157
  end

  test "Day 03 - get result for challenge input part 1" do
    File.read!("./inputs/day_three/challenge_input.txt")
    |> DayThree.get_sum_priorities()
    |> IO.inspect(label: "Day 03 - Part 01: result for challenge input part 1 is")
  end


  test "Day 03 Part 2 - for test input sum of priorities is 70" do
    assert File.read!("./inputs/day_three/test_input.txt")
           |> DayThreePart2.get_sum_priorities() == 70
  end

  test "Day 03 part 2 - result for challenge input part 2" do
    File.read!("./inputs/day_three/challenge_input.txt")
    |> DayThreePart2.get_sum_priorities()
    |> IO.inspect(label: "Day 03 - Part 02: result for challenge input part 2 is")
  end
end
