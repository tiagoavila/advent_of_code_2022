defmodule DayThirteen do
  def check_pair_is_in_right_order?(input) do
    input
    |> parse_line_to_pair_tuple()
		|> IO.inspect()
		# |> then(fn {left_pair, right_pair} -> pair_is_in_right_order?(left_pair, right_pair) end)
  end

	defp parse_line_to_pair_tuple(line) do
		line
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      {pair_item, _} = Code.eval_string(line)
      pair_item
    end)
		|> Enum.zip()
	end

	# defp pair_is_in_right_order?([[left_head] | left_tail], [[right_head] | right_tail]) do
	# 	IO.puts("Heads are both lists. left_head: #{left_head} - right_head: #{right_head}")
	# 	pair_is_in_right_order?(left_tail, right_tail)
	# end

	defp pair_is_in_right_order?([head | left_tail], [head | right_tail]) do
		IO.puts("Heads are equal. head: #{head}")
		pair_is_in_right_order?(left_tail, right_tail)
	end

	defp pair_is_in_right_order?([left_head | _], [right_head | _]) when left_head > right_head
	do
		IO.puts("left head is greater - left_head: #{left_head} - right_head: #{right_head}")
		false
	end

	defp pair_is_in_right_order?([left_head | _], [right_head | _]) when left_head < right_head do
		IO.puts("left head is smaller - left_head: #{left_head} - right_head: #{right_head}")
		true
	end
end
