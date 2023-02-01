defmodule DayThirteen do
  def get_sum_of_pairs_with_right_order(input) do
    input
    |> String.split("\n\n", trim: true)
    |> Enum.with_index(1)
    |> Enum.reduce(0, fn {pair, pair_number}, acc ->
      if check_pair_is_in_right_order?(pair) == true, do: acc + pair_number, else: acc
    end)
  end

  def check_pair_is_in_right_order?(input) do
    [left, right] =
      input
      |> parse_line_to_pair_data()

    check_order_in_left_and_right_lists(left, right)
    |> then(fn {_, value} -> value end)
  end

  defp check_order_in_left_and_right_lists(left, right) do
    Enum.zip(left, right)
    |> Enum.reduce_while(:continue, fn {left_item, right_item}, _acc ->
      check_pair?(left_item, right_item)
    end)
    |> then(fn value -> check_for_remaining_items(value, length(left), length(right)) end)
  end

  defp parse_line_to_pair_data(line) do
    line
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      {pair_item, _} = Code.eval_string(line)
      pair_item
    end)
  end

  # both values are integer and have the same value, continue checking
  defp check_pair?(value, value) when is_integer(value), do: {:cont, :continue}

  # left is greater than right, not in right order
  defp check_pair?(left, right) when is_integer(left) and is_integer(right) and left > right,
    do: {:halt, false}

  # left is smaller than right, is in right order
  defp check_pair?(left, right) when is_integer(left) and is_integer(right) and left < right,
    do: {:halt, true}

  # both are lists, continue checking
  defp check_pair?(left, right) when is_list(left) and is_list(right),
    do: check_order_in_left_and_right_lists(left, right)

  # right is integer, parse it to list and continue checking
  defp check_pair?(left, right) when is_list(left) and is_integer(right),
    do: check_order_in_left_and_right_lists(left, [right])

  # left is integer, parse it to list and continue checking
  defp check_pair?(left, right) when is_integer(left) and is_list(right),
    do: check_order_in_left_and_right_lists([left], right)

  # lists have the same length after running reduce_while and returned :continue, continue checking
  defp check_for_remaining_items(:continue, count, count), do: {:cont, :continue}

  # lists don't have the same length after running reduce_while and returned :continue,
  # If the left list runs out of items first, the inputs are in the right order.
  # If the right list runs out of items first, the inputs are not in the right order
  defp check_for_remaining_items(:continue, left_count, right_count),
    do: {:halt, left_count < right_count}

  # check_pair found if order is correct or not, so just return the value with :halt to stop the reduce_while
  defp check_for_remaining_items(value, _, _), do: {:halt, value}
end
