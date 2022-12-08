defmodule DayFourPart2 do
  def get_inputs_overlap(assignments) do
    assignments
    |> String.split("\n", trim: true)
    |> Enum.count(&input_overlap_another?/1)
  end

  defp input_overlap_another?(input) do
    input
    |> String.split(",", trim: true)
    |> Enum.map(&parse_pair/1)
    |> List.to_tuple()
    |> then(&pair_contains_another?/1)
  end

  defp parse_pair(pair) do
    pair
    |> String.split("-", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple()
  end

  defp pair_contains_another?({{elf1_section1, elf1_section2}, {elf2_section1, elf2_section2}}) do
    Enum.concat(elf1_section1..elf1_section2, elf2_section1..elf2_section2)
    |> Enum.reduce_while(%MapSet{}, fn x, acc ->
      if MapSet.member?(acc, x), do: {:halt, true}, else: {:cont, MapSet.put(acc, x)}
    end)
    |> is_boolean() # Returns true if term is either the atom true or the atom false (i.e., a boolean); otherwise returns false.
  end
end

