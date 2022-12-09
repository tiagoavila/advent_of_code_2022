defmodule DayFivePart2 do
    def get_crates_on_top(input) do
      input
      |> parse_input()
      |> process_rearrangement_instructions()
      |> get_top_crates()
    end

    def parse_input(input) do
      {stacks, rearrangement_instructions} =
        input
        |> String.split("\n\n", trim: true)
        |> List.to_tuple()

      stacks_map =
        stacks
        |> parse_stacks_to_map()

      rearrangement_instructions_list =
        rearrangement_instructions
        |> parse_rearrangement_instructions_to_tuple_list()

      {stacks_map, rearrangement_instructions_list}
    end

    def process_rearrangement_instructions({stacks, rearrangement_instructions}) do
      rearrangement_instructions
      |> Enum.reduce(stacks, &update_stack_on_rearrangement/2)
    end

    def get_top_crates(stacks_map_after_rearrangement) do
      stacks_map_after_rearrangement
      |> Map.values
      |> Enum.reduce([], fn stack, acc -> [hd(stack) | acc] end)
      |> Enum.join()
      |> String.reverse()
    end

    def update_stack_on_rearrangement({1, from_stack, to_stack}, stacks_map) do
      [crate_to_move | _] = stacks_map[from_stack]

      stacks_map
      |> Map.update!(from_stack, &(tl(&1)))
      |> Map.update!(to_stack, &([crate_to_move | &1 ]))
    end

    def update_stack_on_rearrangement({amount_to_move, from_stack, to_stack}, stacks_map) do
      {crates_to_move, remaining_from_stack} = Enum.split(stacks_map[from_stack], amount_to_move)

      stacks_map
      |> Map.update!(from_stack, fn _existing_value -> remaining_from_stack end)
      |> Map.update!(to_stack, fn existing_value -> crates_to_move ++ existing_value end)
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
      |> Enum.map(&String.split(&1, " ", trim: true))
      |> Map.new(fn [crates, stack_number] -> {stack_number, String.graphemes(crates)} end)
    end

    @doc """
    parse a rearrangement instruction from the format
    "move 1 from 2 to 1"
    "move 3 from 1 to 3"
    to a list of tuples like
    [{1, "2", "1"}, {3, "1", "3"}]
    """
    def parse_rearrangement_instructions_to_tuple_list(rearrangement_instructions) do
      Regex.scan(~r/[0-9]+/, rearrangement_instructions)
      |> Enum.concat()
      |> Enum.chunk_every(3)
      |> Enum.map(fn [move, from, to] -> {String.to_integer(move), from, to} end)

      #    rearrange_instructions
      #    |> String.split("\n", trim: true)
      #    |> Enum.map(&(Regex.scan(~r/[0-9]/, &1) |> Enum.concat() |> List.to_tuple()))
    end
  end

