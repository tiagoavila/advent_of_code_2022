defmodule DaySix do
  @min_marker_package_position 4
  @min_message_package_position 14

	def get_start_of_packet_marker(input) do
	  input
    |> String.graphemes()
    |> Stream.chunk_every(4, 1)
    |> Stream.take_while(&there_is_unique_chars?/1)
    |> Enum.to_list()
    |> Enum.count()
    |> then(fn repeated_sets -> repeated_sets + @min_marker_package_position end)
	end

  def get_start_of_message_marker(input) do
    input
    |> String.graphemes()
    |> Stream.chunk_every(14, 1)
    |> Stream.take_while(&there_is_unique_chars?/1)
    |> Enum.to_list()
    |> Enum.count()
    |> then(fn repeated_sets -> repeated_sets + @min_message_package_position end)
  end

  defp there_is_unique_chars?(subset) do
    subset
    |> Enum.reduce_while(%MapSet{}, fn x, acc ->
      if MapSet.member?(acc, x), do: {:halt, true}, else: {:cont, MapSet.put(acc, x)}
    end)
    |> is_boolean()
  end
end
