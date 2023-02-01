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

  test "Day 13 - testing pair 3: it isn't in right order" do
    assert """
           [9]
           [[8,7,6]]
           """
           |> DayThirteen.check_pair_is_in_right_order?() == false
  end

  test "Day 13 - testing pair 4: it's in right order" do
    assert """
           [[4,4],4,4]
           [[4,4],4,4,4]
           """
           |> DayThirteen.check_pair_is_in_right_order?() == true
  end

  test "Day 13 - testing pair 5: it isn't in right order" do
    assert """
           [7,7,7,7]
           [7,7,7]
           """
           |> DayThirteen.check_pair_is_in_right_order?() == false
  end

  test "Day 13 - testing pair 6: it's in right order" do
    assert """
           []
           [3]
           """
           |> DayThirteen.check_pair_is_in_right_order?() == true
  end

  test "Day 13 - testing pair 7: it isn't in right order" do
    assert """
           [[[]]]
           [[]]
           """
           |> DayThirteen.check_pair_is_in_right_order?() == false
  end

  test "Day 13 - testing pair 8: it isn't in right order" do
    assert """
           [1,[2,[3,[4,[5,6,7]]]],8,9]
           [1,[2,[3,[4,[5,6,0]]]],8,9]
           """
           |> DayThirteen.check_pair_is_in_right_order?() == false
  end

  test "Day 13 -  for test input sum of the indices of pairs with right orders is 13" do
    assert File.read!("./inputs/day_thirteen/test_input.txt")
           |> DayThirteen.get_sum_of_pairs_with_right_order() == 13
  end

  test "Day 13 - get result for challenge input part 1" do
    File.read!("./inputs/day_thirteen/challenge_input.txt")
    |> DayThirteen.get_sum_of_pairs_with_right_order()
    |> IO.inspect(label: "Day 13 - Part 01: result for challenge input part 1 is")
  end

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
