defmodule DayTwelveTest do
  use ExUnit.Case
  doctest DayTwelve

  test "Day 12 - for test input the fewest steps required to move from your current
  position to the location that should get the best signal is 31" do
    assert File.read!("./inputs/day_twelve/test_input.txt")
           |> DayTwelve.get_step_number_of_smallest_path() == 31
  end

  # test "Day 12 - get result for challenge input part 1" do
  #   File.read!("./inputs/day_twelve/challenge_input.txt")
  #   |> DayTwelve.get_level_of_monkey_business()
  #   |> IO.inspect(label: "Day 12 - Part 01: result for challenge input part 1 is")
  # end

  #  test "Day 12 Part 2 - for test input the level of monkey business after
  #   10_000 rounds of stuff-slinging simian shenanigans is 2_713_310_158" do
  #    assert File.read!("./inputs/day_twelve/test_input.txt")
  #           |> DayTwelve.get_level_of_monkey_business(1_000) == 2_713_310_158
  #  end

  #  test "Day 12 Part 2 - for test input 2 the number of positions the tail of the rope visits at least once is 36" do
  #    assert File.read!("./inputs/day_twelve/test_input2.txt")
  #           |> DayTwelvePart2.get_positions_tail_visited({12, 15}) == 36
  #  end
  #
  #  test "Day 12 part 2 - result for challenge input part 2" do
  #    File.read!("./inputs/day_twelve/challenge_input.txt")
  #    |> DayTwelvePart2.get_positions_tail_visited()
  #    |> IO.inspect(label: "Day 12 - Part 02: result for challenge input part 2 is")
  #  end
end
