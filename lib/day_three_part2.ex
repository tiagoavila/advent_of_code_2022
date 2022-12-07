defmodule DayThreePart2 do
  import DayThree, only: [get_priority: 1]

  def get_sum_priorities(contents) do
    contents
    |> String.split("\n", trim: true)
    |> Enum.chunk_every(3)
    |> Enum.map(&get_repeated_item/1)
    |> Enum.map(&get_priority/1)
    |> Enum.sum()
  end

  defp get_repeated_item(content_by_group) do
    {rucksack1, rucksack2, rucksack3} = content_by_group
    |> List.to_tuple()

    rucksack1
    |> String.graphemes()
    |> Enum.find(&(String.contains?(rucksack2, &1) and String.contains?(rucksack3, &1)))
  end
end
