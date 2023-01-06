defmodule DayElevenTest do
  use ExUnit.Case
  doctest DayEleven

  test "Day 11 - for test input the level of monkey business after
    20 rounds of stuff-slinging simian shenanigans is 10605" do
    assert File.read!("./inputs/day_eleven/test_input.txt")
           |> DayEleven.get_level_of_monkey_business() == 10605
  end

  # test "Day 11 - get result for challenge input part 1" do
  #   File.read!("./inputs/day_eleven/challenge_input.txt")
  #   |> DayEleven.get_signal_strengths_sum()
  #   |> IO.inspect(label: "Day 11 - Part 01: result for challenge input part 1 is")
  # end

  #  test "Day 11 Part 2 - for test input the number of positions the tail of the rope visits at least once is 1" do
  #    assert File.read!("./inputs/day_eleven/test_input.txt")
  #           |> DayElevenPart2.get_positions_tail_visited() == 1
  #  end
  #
  #  test "Day 11 Part 2 - for test input 2 the number of positions the tail of the rope visits at least once is 36" do
  #    assert File.read!("./inputs/day_eleven/test_input2.txt")
  #           |> DayElevenPart2.get_positions_tail_visited({11, 15}) == 36
  #  end
  #
  #  test "Day 11 part 2 - result for challenge input part 2" do
  #    File.read!("./inputs/day_eleven/challenge_input.txt")
  #    |> DayElevenPart2.get_positions_tail_visited()
  #    |> IO.inspect(label: "Day 11 - Part 02: result for challenge input part 2 is")
  #  end
end
