defmodule DayFivePart2 do
    import DayFive, only: [get_top_crates: 1, parse_input: 1]

    def get_crates_on_top(input) do
      input
      |> parse_input()
      |> process_rearrangement_instructions()
      |> get_top_crates()
    end

    def process_rearrangement_instructions({stacks, rearrangement_instructions}) do
      rearrangement_instructions
      |> Enum.reduce(stacks, &update_stack_on_rearrangement/2)
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
  end

