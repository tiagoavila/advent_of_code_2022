defmodule DayFourTest do
  use ExUnit.Case
  doctest DayFour

  test "Day 04 - for test input number of assignment pairs that range fully contain the other is 2" do
    assert File.read!("./inputs/day_four/test_input.txt")
           |> DayFour.get_inputs_fully_contain_the_other() == 2
  end

  test "Day 04 - get result for challenge input part 1" do
    File.read!("./inputs/day_four/challenge_input.txt")
    |> DayFour.get_inputs_fully_contain_the_other()
    |> IO.inspect(label: "Day 04 - Part 01: result for challenge input part 1 is")
  end


  test "Day 04 Part 2 - for test input number of assignment pairs that overlap is 4" do
    assert File.read!("./inputs/day_four/test_input.txt")
           |> DayFourPart2.get_inputs_overlap() == 4
  end

  test "Day 04 part 2 - result for challenge input part 2" do
    File.read!("./inputs/day_four/challenge_input.txt")
    |> DayFourPart2.get_inputs_overlap()
    |> IO.inspect(label: "Day 04 - Part 02: result for challenge input part 2 is")
  end
end
