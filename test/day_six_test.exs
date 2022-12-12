defmodule DaySixTest do
  use ExUnit.Case
  doctest DaySix

  test "Day 06 - for test input mjqjpqmgbljsphdztnvjfqwrcgsmlb first marker is after character 7" do
    assert "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
           |> DaySix.get_start_of_packet_marker() == 7
  end

  @tag :pending
  test "Day 06 - for test input bvwbjplbgvbhsrlpgdmjqwftvncz first marker is after character 5" do
    assert "bvwbjplbgvbhsrlpgdmjqwftvncz"
           |> DaySix.get_start_of_packet_marker() == 5
  end

  @tag :pending
  test "Day 06 - for test input nppdvjthqldpwncqszvftbrmjlhg first marker is after character 6" do
    assert "nppdvjthqldpwncqszvftbrmjlhg"
           |> DaySix.get_start_of_packet_marker() == 6
  end

  @tag :pending
  test "Day 06 - for test input nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg first marker is after character 10" do
    assert "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"
           |> DaySix.get_start_of_packet_marker() == 10
  end

  @tag :pending
  test "Day 06 - for test input zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw first marker is after character 11" do
    assert "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"
           |> DaySix.get_start_of_packet_marker() == 11
  end

  test "Day 06 - get result for challenge input part 1" do
    File.read!("./inputs/day_six/challenge_input.txt")
    |> DaySix.get_start_of_packet_marker()
    |> IO.inspect(label: "Day 06 - Part 01: result for challenge input part 1 is")
  end

  test "Day 06 Part 02 - for test input mjqjpqmgbljsphdztnvjfqwrcgsmlb first marker is after character 19" do
    assert "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
           |> DaySix.get_start_of_message_marker() == 19
  end

  @tag :pending
  test "Day 06 Part 02 - for test input bvwbjplbgvbhsrlpgdmjqwftvncz first marker is after character 23" do
    assert "bvwbjplbgvbhsrlpgdmjqwftvncz"
           |> DaySix.get_start_of_message_marker() == 23
  end

  @tag :pending
  test "Day 06 Part 02 - for test input nppdvjthqldpwncqszvftbrmjlhg first marker is after character 23" do
    assert "nppdvjthqldpwncqszvftbrmjlhg"
           |> DaySix.get_start_of_message_marker() == 23
  end

  @tag :pending
  test "Day 06 Part 02 - for test input nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg first marker is after character 29" do
    assert "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"
           |> DaySix.get_start_of_message_marker() == 29
  end

  @tag :pending
  test "Day 06 Part 02 - for test input zcfzfwzzqfrljwlrfnpqdbhtmscgvjw first marker is after character 26" do
    assert "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"
           |> DaySix.get_start_of_message_marker() == 26
  end

  test "Day 06 Part 02 - get result for challenge input part 2" do
    File.read!("./inputs/day_six/challenge_input.txt")
    |> DaySix.get_start_of_message_marker()
    |> IO.inspect(label: "Day 06 - Part 02: result for challenge input part 2 is")
  end
end
