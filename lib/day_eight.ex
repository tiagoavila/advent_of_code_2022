defmodule DayEight do
  def get_number_of_visible_trees(input) do
    length =
      input
      |> String.split("\n")
      |> Enum.count()

    grid =
      input
      |> parse_grid()

    grid
    |> Enum.count(fn {row, col, height} -> tree_is_visible?(grid, row, col, height, length) end)
  end

  def parse_grid(input) do
    input
    |> String.split("\n")
    |> Enum.with_index()
    |> Enum.reduce([], fn {row, row_index}, acc -> [parse_row(row, row_index, acc) | acc] end)
    |> Enum.reverse()
    |> Enum.concat()
  end

  defp parse_row(row, row_index, acc) do
    row
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.reduce([], fn {height, col_index}, acc ->
      [{row_index, col_index, String.to_integer(height)} | acc]
    end)
    |> Enum.reverse()
  end

  defp tree_is_visible?(_, row, col, _, grid_length)
       when row == 0 or col == 0 or row == grid_length - 1 or col == grid_length - 1 do
    true
  end

  defp tree_is_visible?(grid, tree_index_row, tree_index_col, tree_height, grid_length) do
    row =
      grid
      |> Enum.filter(fn {row_index, _, _} -> row_index == tree_index_row end)

    col =
      grid
      |> Enum.filter(fn {_, col_index, _} -> col_index == tree_index_col end)

    with false <- tree_is_visible_from_left?(row, tree_index_col, tree_height, grid_length),
         false <- tree_is_visible_from_right?(row, tree_index_col, tree_height, grid_length),
         false <- tree_is_visible_from_top?(col, tree_index_row, tree_height, grid_length),
         false <- tree_is_visible_from_bottom?(col, tree_index_row, tree_height, grid_length) do
      false
    else
      _ -> true
    end
  end

  defp tree_is_visible_from_left?(row, col_index, tree_height, grid_length) do
    row
    |> Enum.slice(0, col_index)
    |> Enum.all?(fn {_, _, height} -> height < tree_height end)
  end

  defp tree_is_visible_from_right?(row, col_index, tree_height, grid_length) do
    row
    |> Enum.slice(col_index + 1, length(row) - col_index)
    |> Enum.all?(fn {_, _, height} -> height < tree_height end)
  end

  defp tree_is_visible_from_top?(col, row_index, tree_height, grid_length) do
    col
    |> Enum.slice(0, row_index)
    |> Enum.all?(fn {_, _, height} -> height < tree_height end)
  end

  defp tree_is_visible_from_bottom?(col, row_index, tree_height, grid_length) do
    col
    |> Enum.slice(row_index + 1, length(col) - row_index)
    |> Enum.all?(fn {_, _, height} -> height < tree_height end)
  end
end
