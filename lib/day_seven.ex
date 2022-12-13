defmodule DaySeven do
  defstruct parent_dirs: [], current_dir: "/", dirs: %{}

  def get_total_size_of_directories_at_most_100k(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(%DaySeven{}, &process_line/2)
#    |> Enum.filter(&is_size_less_than_100k?/1)
#    |> Enum.sum()
  end

  defp process_line("$ cd /", acc) do
    acc
  end

  defp process_line("$ ls", acc) do
    acc
  end

  defp process_line("dir " <> _rest, acc) do
    acc
  end

  defp process_line("$ cd ..", %DaySeven{parent_dirs: [latest_parent | remaining_parents]} = acc) do
    %{acc | current_dir: latest_parent, parent_dirs: remaining_parents}
  end

  defp process_line("$ cd " <> dir_name, %DaySeven{current_dir: "/"} = acc) do
    %{acc | current_dir: dir_name, parent_dirs: ["/"]}
  end

  defp process_line("$ cd " <> dir_name, %DaySeven{current_dir: new_parent_dir} = acc) do
    %{acc | current_dir: dir_name, parent_dirs: [new_parent_dir | acc.parent_dirs]}
  end

  defp process_line(file_line, acc) do
    acc
    |> IO.inspect
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
