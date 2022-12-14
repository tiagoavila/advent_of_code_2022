defmodule DaySeven do
  defstruct parent_dirs: [], current_dir: "/", dirs: %{"/" => 0}

  def get_total_size_of_directories_at_most_100k(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(%DaySeven{}, &process_line/2)
    |> then(fn %DaySeven{dirs: dirs} -> dirs |> Map.values() end)
    |> Enum.filter(&is_size_less_than_100k?/1)
    |> Enum.sum()
  end

  defp process_line("$ cd /", acc), do: acc
  defp process_line("$ ls", acc), do: acc
  defp process_line("dir " <> _rest, acc), do: acc

  defp process_line("$ cd ..", %DaySeven{parent_dirs: [latest_parent | remaining_parents]} = acc) do
    %{acc | current_dir: latest_parent, parent_dirs: remaining_parents}
  end

  defp process_line("$ cd " <> dir_name, %DaySeven{current_dir: new_parent_dir} = acc) do
    updated_dirs = Map.put_new(acc.dirs, dir_name, 0)
    %{acc | current_dir: dir_name, parent_dirs: [new_parent_dir | acc.parent_dirs], dirs: updated_dirs}
  end

  defp process_line(file_line, acc) do
    [size | _] =
      file_line
      |> String.split(" ", trim: true)

    size
    |> Integer.parse()
    |> process_file_size(acc)
  end

  defp process_file_size(:error, acc), do: acc

  defp process_file_size({file_size, _}, %DaySeven{current_dir: current_dir} = acc) do
    updated_dirs_with_current_file =
      acc.dirs
      |> Map.update!(current_dir, fn existing_value -> existing_value + file_size end)

    updated_dirs =
      acc.parent_dirs
      |> Enum.reduce(updated_dirs_with_current_file, fn parent, d_acc ->
        d_acc
        |> Map.update!(parent, fn existing_value -> existing_value + file_size end)
      end)

    %{acc | dirs: updated_dirs}
  end

  defp is_size_less_than_100k?(file_size), do: file_size <= 100_000
end
