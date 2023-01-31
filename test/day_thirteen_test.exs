defmodule DayThirteenTest do
  use ExUnit.Case
  doctest DayThirteen

  test "Day 13 - testing pair 1: it's in right order" do
    assert """
           [1,1,3,1,1]
           [1,1,5,1,1]
           """
           |> DayThirteen.check_pair_is_in_right_order?() == true
  end

  test "Day 13 - testing pair 2: it's in right order" do
    assert """
           [[1],[2,3,4]]
           [[1],4]
           """
           |> DayThirteen.check_pair_is_in_right_order?() == true
  end

  # test "Day 13 - get result for challenge input part 1" do
  #   File.read!("./inputs/day_thirteen/challenge_input.txt")
  #   |> DayThirteen.get_step_number_of_smallest_path()
  #   |> IO.inspect(label: "Day 13 - Part 01: result for challenge input part 1 is")
  # end

  #  test "Day 13 Part 2 - for test input fewest steps required to move
  #  starting from any square with elevation a to the location that
  #  should get the best signal is 29" do
  #    assert File.read!("./inputs/day_thirteen/test_input.txt")
  #           |> DayThirteen.get_step_number_of_smallest_path_from_closest_a() == 29
  #  end

  #  test "Day 13 part 2 - result for challenge input part 2" do
  #    File.read!("./inputs/day_thirteen/challenge_input.txt")
  #    |> DayThirteen.get_step_number_of_smallest_path_from_closest_a()
  #    |> IO.inspect(label: "Day 13 - Part 02: result for challenge input part 2 is")
  #  end
end
