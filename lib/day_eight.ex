defmodule DayEight do
  def get_number_of_visible_trees(input) do
    length =
      input
      |> String.split("\n")
      |> Enum.count()
      |> IO.inspect()

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

  defp tree_is_visible?(_, row, col, _, grid_length) when row == 0 or col == 0 or row == grid_length - 1 or col == grid_length - 1 do
    true
  end

  defp tree_is_visible?(grid, tree_row, tree_col, tree_height, grid_length) do
    grid
    |> Enum.filter(fn {row, _, _} -> row == tree_row end)
    |> IO.inspect()

  end
end
