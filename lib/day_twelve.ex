defmodule DayTwelve do
  @spec get_step_number_of_smallest_path(binary) :: {map, any, any}
  def get_step_number_of_smallest_path(input) do
    input
    |> parse()
    |> get_start_and_end_point_part1()
    |> build_graph()
    |> find_shortest_path()
    |> count_number_of_steps()
  end

  def get_step_number_of_smallest_path_from_closest_a(input) do
    input
    |> parse()
    |> get_start_and_end_points_for_part2()
    |> build_graph()
    |> find_shortest_path_part2()
  end

  defp parse(input) do
    input
    |> String.split("\n", trim: true)
    |> to_charlist()
    |> Enum.with_index()
    |> Enum.flat_map(fn {row, y} ->
      row
      |> to_charlist()
      |> Enum.with_index()
      |> Enum.map(fn {height, x} -> {{x, y}, height} end)
    end)
    |> Map.new(fn {coord, height} -> {coord, height} end)
  end

  defp build_graph({map, start_point, end_point}) do
    graph =
      Graph.new()
      |> Graph.add_vertices(Map.keys(map))

    graph =
      Enum.reduce(map, graph, fn {coord = {x, y}, height}, graph ->
        [{x - 1, y}, {x + 1, y}, {x, y + 1}, {x, y - 1}]
        |> Enum.filter(&filter_point(map, &1, height))
        |> Enum.reduce(graph, fn neighbor_coord, graph ->
          graph |> Graph.add_edge(coord, neighbor_coord)
        end)
      end)

    {graph, start_point, end_point}
  end

  defp find_shortest_path({graph, start_point, end_point}) do
    Graph.get_shortest_path(graph, start_point, end_point)
  end

  defp count_number_of_steps(nil) do
    999_999
  end

  defp count_number_of_steps(steps) do
    length(steps) - 1
  end

  defp get_start_and_end_point_part1(map) do
    # Find the starting point
    start_point = elem(Enum.find(map, fn {_, height} -> height == ?S end), 0)
    # Find the ending point
    end_point = elem(Enum.find(map, fn {_, height} -> height == ?E end), 0)

    map = %{map | start_point => ?a, end_point => ?z}

    {map, start_point, end_point}
  end

  defp get_start_and_end_points_for_part2(map) do
    # Find the 'a' points to be considered as starting points like the 'S' point
    a_points =
      map
      |> Map.filter(fn {_, height} -> height == ?a end)
      |> Enum.map(fn {key, _} -> key end)

    {map, start_point, end_point} = get_start_and_end_point_part1(map)

    {map, [start_point | a_points], end_point}
  end

  defp find_shortest_path_part2({graph, start_points, end_point}) do
    start_points
    |> Enum.reduce([], fn start_point, acc ->
      result =
        find_shortest_path({graph, start_point, end_point})
        |> count_number_of_steps()

      [result | acc]
    end)
    |> Enum.min()
  end

  defp filter_point(map, neighbor_coord, height) do
    if Map.has_key?(map, neighbor_coord) && Map.get(map, neighbor_coord) - height <= 1 do
      true
    else
      false
    end
  end
end
