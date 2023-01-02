defmodule DayNineTest do
  use ExUnit.Case
  doctest DayNine

  test "Day 09 - for test input the number of positions the tail of the rope visits at least once is 13" do
    assert File.read!("./inputs/day_nine/test_input.txt")
           |> DayNine.get_positions_tail_visited() == 13
  end

    test "Day 09 - get result for challenge input part 1" do
      File.read!("./inputs/day_nine/challenge_input.txt")
      |> DayNine.get_positions_tail_visited()
      |> IO.inspect(label: "Day 09 - Part 01: result for challenge input part 1 is")
    end

  test "Day 09 Part 2 - for test input the number of positions the tail of the rope visits at least once is 1" do
    assert File.read!("./inputs/day_nine/test_input.txt")
           |> DayNinePart2.get_positions_tail_visited() == 1
  end

  test "Day 09 Part 2 - for test input 2 the number of positions the tail of the rope visits at least once is 36" do
    assert File.read!("./inputs/day_nine/test_input2.txt")
           |> DayNinePart2.get_positions_tail_visited({11, 15}) == 36
  end

  test "Day 09 part 2 - result for challenge input part 2" do
    File.read!("./inputs/day_nine/challenge_input.txt")
    |> DayNinePart2.get_positions_tail_visited()
    |> IO.inspect(label: "Day 09 - Part 02: result for challenge input part 2 is")
  end
end
