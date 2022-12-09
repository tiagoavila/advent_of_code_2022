defmodule DayFive do
  def get_crates_on_top(input) do
    input
    |> parse_input()
  end

  defp parse_input(input) do
    {stacks, rearrange_instructions} = input
    |> String.split("\n\n", trim: true)
    |> List.to_tuple()

    stacks_map = stacks
    |> parse_stacks_to_map()

    rearrange_instructions_list = rearrange_instructions
    |> parse_rearrange_instructions_to_tuple_list()


  end

  @doc """
  Parses the input of stacks to a map,
  where the key is the stack number
  and the value is a list of the crates from top to bottom
  with the head as the top crate.

  E.g.: this input stack:
  [N]
  [Z]
   1
  Becomes this Map: %{"1" => ["N", "Z"]}
  """
  def parse_stacks_to_map(stacks) do
    stacks
    |> String.split("\n", trim: true)
    |> Enum.map(&(String.split(&1, " ", trim: true)))
    |> Map.new(fn [crates, stack_number] -> {stack_number, String.graphemes(crates)} end)
    |> IO.inspect()
  end

  @doc """
  parse a rearrangement instruction from the format
  "move 1 from 2 to 1"
  "move 3 from 1 to 3"
  to a list of tuples like
  [{"1", "2", "1"}, {"3", "1", "3"}]
  """
  def parse_rearrange_instructions_to_tuple_list(rearrange_instructions) do
    rearrange_instructions
    |> String.split("\n", trim: true)
    |> Enum.map(&(Regex.scan(~r/[0-9]/, &1) |> Enum.concat() |> List.to_tuple()))
    |> IO.inspect()
  end
end
