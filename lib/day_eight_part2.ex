defmodule DayEightPart2 do
  def get_highest_scenic_score(input) do
    grid_length =
      input
      |> String.split("\n")
      |> Enum.count()

    grid =
      input
      |> parse_grid_to_map()

    # No need to check the indexes 0 or the length - 1 because the formula is a multiplication and those will always be zero
    min_edge_index = 1
    max_edge_index = grid_length - 2

    for row <- min_edge_index..max_edge_index, col <- min_edge_index..max_edge_index, into: [] do
      get_scenic_score(row, col, grid, grid_length)
    end
    |> Enum.max()
  end

  defp parse_grid_to_map(input) do
    input
    |> String.split("\n")
    |> Enum.with_index()
    |> Enum.reduce([], fn {row, row_index}, acc -> [parse_row(row, row_index) | acc] end)
    |> Enum.concat()
    |> Map.new(fn {row, col, height} -> {{row, col}, height} end)
  end

  defp parse_row(row, row_index) do
    row
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.reduce([], fn {height, col_index}, acc ->
      [{row_index, col_index, String.to_integer(height)} | acc]
    end)
    |> Enum.reverse()
  end

  @directions_shift [:left, :top, :right, :bottom]

  defp get_scenic_score(tree_index_row, tree_index_col, grid, grid_length) do
    tree_height = grid[{tree_index_row, tree_index_col}]

    @directions_shift
    |> Enum.reduce(
      1,
      &get_scenic_score_on_direction(
        &1,
        &2,
        tree_height,
        tree_index_row,
        tree_index_col,
        grid,
        grid_length
      )
    )
  end

  defp get_scenic_score_on_direction(
         :left,
         acc,
         tree_height,
         tree_index_row,
         tree_index_col,
         grid,
         _
       ) do
    acc *
      ((tree_index_col - 1)..0//-1
       |> Enum.reduce_while(0, fn col_index, acc ->
        calculate_score(acc, tree_index_row, col_index, tree_height, grid)
       end))
  end

  defp get_scenic_score_on_direction(
         :right,
         acc,
         tree_height,
         tree_index_row,
         tree_index_col,
         grid,
         grid_length
       ) do
    acc *
      ((tree_index_col + 1)..(grid_length - 1)
       |> Enum.reduce_while(0, fn col_index, acc ->
        calculate_score(acc, tree_index_row, col_index, tree_height, grid)
       end))
  end

  defp get_scenic_score_on_direction(
         :top,
         acc,
         tree_height,
         tree_index_row,
         tree_index_col,
         grid,
         _
       ) do
    acc *
      ((tree_index_row - 1)..0//-1
       |> Enum.reduce_while(0, fn row_index, acc ->
        calculate_score(acc, row_index, tree_index_col, tree_height, grid)
       end))
  end

  defp get_scenic_score_on_direction(
         :bottom,
         acc,
         tree_height,
         tree_index_row,
         tree_index_col,
         grid,
         grid_length
       ) do
    acc *
      ((tree_index_row + 1)..(grid_length - 1)
       |> Enum.reduce_while(0, fn row_index, acc ->
         calculate_score(acc, row_index, tree_index_col, tree_height, grid)
       end))
  end

  defp calculate_score(acc, row_index, col_index, main_tree_height, grid) do
    if grid[{row_index, col_index}] < main_tree_height,
      do: {:cont, acc + 1},
      else: {:halt, acc + 1}
  end
end
