defmodule DayTwelveTest do
  use ExUnit.Case
  doctest DayTwelve

  test "Day 12 - for test input the fewest steps required to move from your current
  position to the location that should get the best signal is 31" do
    assert File.read!("./inputs/day_twelve/test_input.txt")
           |> DayTwelve.get_step_number_of_smallest_path() == 31
  end

  test "Day 12 - get result for challenge input part 1" do
    File.read!("./inputs/day_twelve/challenge_input.txt")
    |> DayTwelve.get_step_number_of_smallest_path()
    |> IO.inspect(label: "Day 12 - Part 01: result for challenge input part 1 is")
  end

   test "Day 12 Part 2 - for test input fewest steps required to move
   starting from any square with elevation a to the location that
   should get the best signal is 29" do
     assert File.read!("./inputs/day_twelve/test_input.txt")
            |> DayTwelve.get_step_number_of_smallest_path_from_closest_a() == 29
   end

   test "Day 12 part 2 - result for challenge input part 2" do
     File.read!("./inputs/day_twelve/challenge_input.txt")
     |> DayTwelve.get_step_number_of_smallest_path_from_closest_a()
     |> IO.inspect(label: "Day 12 - Part 02: result for challenge input part 2 is")
   end
end
