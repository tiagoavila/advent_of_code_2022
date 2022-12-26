defmodule DaySeven do
  #  defstruct parent_dirs: [], current_dir: "/", dirs: %{"/" => 0}
  #
  #  @disk_space 70_000_000
  #
  #  def get_total_size_of_directories_at_most_100k(input) do
  #    input
  #    |> process_lines()
  #    |> then(fn %DaySeven{dirs: dirs} -> dirs |> Map.values() end)
  #    |> Enum.filter(&is_size_less_than_100k?/1)
  #    |> Enum.sum()
  #  end
  #
  #  def get_total_size_of_directory_to_free_space(input) do
  #    input
  #    |> process_lines()
  #    |> then(&find_directory_to_delete/1)
  #  end
  #
  #  defp find_directory_to_delete(%DaySeven{dirs: %{"/" => root_dir_size} = dirs}) do
  #    unused_space = @disk_space - root_dir_size
  #
  #    dirs
  #    |> Map.values()
  #    |> Enum.filter(fn size -> size >= unused_space end)
  #    |> Enum.sort()
  #    |> hd()
  #  end
  #
  #  defp process_lines(input) do
  #    input
  #    |> String.split("\n", trim: true)
  #    |> Enum.reduce(%DaySeven{}, &process_line/2)
  #  end
  #
  #  defp process_line("$ cd /", acc), do: acc
  #  defp process_line("$ ls", acc), do: acc
  #  defp process_line("dir " <> _rest, acc), do: acc
  #
  #  defp process_line("$ cd ..", %DaySeven{parent_dirs: [latest_parent | remaining_parents]} = acc) do
  #    %{acc | current_dir: latest_parent, parent_dirs: remaining_parents}
  #  end
  #
  #  defp process_line("$ cd " <> dir_name, %DaySeven{current_dir: new_parent_dir} = acc) do
  #    updated_parent_dirs = [new_parent_dir | acc.parent_dirs]
  #
  #    full_dir_name =
  #      ([dir_name] ++ updated_parent_dirs)
  #      |> Enum.join("/")
  #
  #    updated_dirs = Map.put(acc.dirs, full_dir_name, 0)
  #    %{acc | current_dir: full_dir_name, parent_dirs: updated_parent_dirs, dirs: updated_dirs}
  #  end
  #
  #  defp process_line(file_line, acc) do
  #    [size | _] =
  #      file_line
  #      |> String.split(" ", trim: true)
  #
  #    size
  #    |> Integer.parse()
  #    |> process_file_size(acc)
  #  end
  #
  #  defp process_file_size(:error, acc), do: acc
  #
  #  defp process_file_size({file_size, _}, %DaySeven{current_dir: current_dir} = acc) do
  #    updated_dirs_with_current_file =
  #      acc.dirs
  #      |> Map.update!(current_dir, fn existing_value -> existing_value + file_size end)
  #
  #    updated_dirs =
  #      acc.parent_dirs
  #      |> Enum.reduce(updated_dirs_with_current_file, fn parent, d_acc ->
  #        d_acc
  #        |> Map.update!(parent, fn existing_value -> existing_value + file_size end)
  #      end)
  #
  #    %{acc | dirs: updated_dirs}
  #  end
  #
  #  defp is_size_less_than_100k?(file_size), do: file_size <= 100_000

  defstruct prefix: nil, files: %{}, dirs: %{}

  def parse_files(text) do
    state =
      text
      |> String.split("\n")
      |> Enum.reject(&(&1 == ""))
      |> Enum.reduce(%__MODULE__{}, fn
        "$ cd /", state ->
          %__MODULE__{state | prefix: "/"}

        "$ cd ..", state ->
          %__MODULE__{state | prefix: Path.dirname(state.prefix)}

        "$ cd " <> dir, state ->
          %__MODULE__{state | prefix: Path.join(state.prefix, dir)}

        "$ ls", state ->
          state

        "dir " <> _, state ->
          state

        file_info, state ->
          [size, filename] = String.split(file_info, " ", parts: 2)
          files = Map.put(state.files, Path.join(state.prefix, filename), String.to_integer(size))
          %__MODULE__{state | files: files}
      end)

    Enum.reduce(state.files, state, fn {path, size}, state ->
      path
      |> stream_of_parent_directories()
      |> Enum.reduce(state, fn dir, state ->
        update_in(state, [Access.key!(:dirs), Access.key(dir, 0)], &(&1 + size))
      end)
    end)
  end

  defp stream_of_parent_directories(path) do
    Stream.unfold(path, fn
      nil ->
        nil

      path ->
        case Path.dirname(path) do
          "/" -> {"/", nil}
          dir -> {dir, dir}
        end
    end)
  end

  def find_sum_of_small_folders(text) do
    text
    |> parse_files()
    |> Map.fetch!(:dirs)
    |> Map.values()
    |> Enum.filter(fn size -> size < 100_000 end)
    |> Enum.sum()
  end

  def find_size_of_smallest_directory_to_delete(text) do
    dirs =
      text
      |> parse_files()
      |> Map.fetch!(:dirs)

    total_space = 70_000_000
    total_used = dirs["/"]
    total_free = total_space - total_used
    size_update = 30_000_000
    size_to_be_freed = size_update - total_free

    dirs
    |> Map.values()
    |> Enum.filter(fn size -> size >= size_to_be_freed end)
    |> Enum.min()
  end
end
