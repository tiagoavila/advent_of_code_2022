defmodule DaySeven do
	def get_total_size_of_directories_at_most_100k(input) do
    input
    |> String.split("\n", trim: true)
    |> IO.inspect
    |> Enum.map(&process_line/1)
	end

  defp process_line(<<codepoint::utf8, rest::binary>> = line) when codepoint == ?$ do
1
  end

  defp process_line(line) do
    2
  end
end
