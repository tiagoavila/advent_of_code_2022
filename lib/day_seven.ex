defmodule DaySeven do
  def get_total_size_of_directories_at_most_100k(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&get_file_sizes/1)
    |> Enum.filter(&is_size_less_than_100k?/1)
    |> Enum.sum()
  end

  defp get_file_sizes("$" <> _rest) do
    0
  end

  defp get_file_sizes("dir" <> _rest) do
    0
  end

  defp get_file_sizes(line) do
    [size | _rest] =
      line
      |> String.split(" ", trim: true)

    size
    |> String.to_integer()
    |> IO.inspect
  end

  defp is_size_less_than_100k?(file_size), do: file_size < 100000
end
