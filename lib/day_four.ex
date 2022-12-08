defmodule DayFour do
	def get_inputs_fully_contain_the_other(assignments) do
	  assignments
    |> String.split("\n", trim: true)
    |> Enum.count(&input_fully_contain_another?/1)
	end

  defp input_fully_contain_another?(input) do
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
    (elf1_section1 >= elf2_section1 && elf1_section2 <= elf2_section2) || (elf2_section1 >= elf1_section1 && elf2_section2 <= elf1_section2)
  end
end
