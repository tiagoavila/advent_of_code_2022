defmodule DayThirteen do
  defmodule PairData do
    defstruct [:pair_tuples, :left_count, :right_count]
  end

  def check_pair_is_in_right_order?(input) do
    %PairData{pair_tuples: pair_tuples, left_count: left_count, right_count: right_count} =
      input
      |> parse_line_to_pair_data()

    pair_tuples
    |> Enum.reduce_while(:continue, fn {left, right}, _acc ->
      pair_is_in_right_order?(left, right)
    end)
    |> IO.inspect(label: "test")

    # |> then(fn {left_pair, right_pair} -> pair_is_in_right_order?(left_pair, right_pair) end)
  end

  defp parse_line_to_pair_data(line) do
    [left, right] =
      line
      |> String.split("\n", trim: true)
      |> Enum.map(fn line ->
        {pair_item, _} = Code.eval_string(line)
        pair_item
      end)

    %PairData{
      pair_tuples: Enum.zip(left, right),
      left_count: length(left),
      right_count: length(right)
    }
  end

  # defp pair_is_in_right_order?([[left_head] | left_tail], [[right_head] | right_tail]) do
  # 	IO.puts("Heads are both lists. left_head: #{left_head} - right_head: #{right_head}")
  # 	pair_is_in_right_order?(left_tail, right_tail)
  # end

  defp pair_is_in_right_order?(value, value) when is_integer(value) do
    # IO.puts("Heads are equal. head: #{value}")
    {:cont, :continue}
  end

  defp pair_is_in_right_order?(left, right)
       when is_integer(left) and is_integer(right) and left > right do
    # IO.puts("left head is greater - left_head: #{left_head} - right_head: #{right_head}")
    {:halt, false}
  end

  defp pair_is_in_right_order?(left, right)
       when is_integer(left) and is_integer(right) and left < right do
    # IO.puts("left head is smaller - left_head: #{left_head} - right_head: #{right_head}")
    {:halt, true}
  end

  defp pair_is_in_right_order?(left, right)
       when is_list(left) and is_list(right) do
    # IO.puts("left head is greater - left_head: #{left_head} - right_head: #{right_head}")
    {:halt, false}
  end
end
