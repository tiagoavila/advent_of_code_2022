defmodule DayTen do
  defmodule CyclesAccumulator do
    defstruct x: 1, current_cycle: 0, cycle_to_update_sum: 20, value_to_add: 0, strengths_sum: 0
  end

  def get_signal_strengths_sum(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(%CyclesAccumulator{}, &process_instruction/2)
    |> then(fn %CyclesAccumulator{strengths_sum: strengths_sum} -> strengths_sum end)
  end

  defp process_instruction("noop", acc) do
    current_cycle = acc.current_cycle + 1
    x_updated = acc.x + acc.value_to_add
    value_to_add = 0

    process_instruction(current_cycle, x_updated, value_to_add, acc)
  end

  defp process_instruction("addx " <> new_value_to_add, acc) do
    current_cycle = acc.current_cycle + 2
    x_updated = acc.x + acc.value_to_add
    value_to_add = String.to_integer(new_value_to_add)

    process_instruction(current_cycle, x_updated, value_to_add, acc)
  end

  defp process_instruction(current_cycle, x_updated, value_to_add, acc) do
    %{
      acc
    | current_cycle: current_cycle,
      x: x_updated,
      value_to_add: value_to_add
    }
    |> attempt_to_update_sum()
  end

  defp attempt_to_update_sum(
         %CyclesAccumulator{
           current_cycle: current_cycle,
           cycle_to_update_sum: cycle_to_update_sum
         } = acc
       )
       when current_cycle >= cycle_to_update_sum do
    next_cycle_to_update_sum = cycle_to_update_sum + 40

    signal_strength = cycle_to_update_sum * acc.x

    %{
      acc
      | strengths_sum: signal_strength + acc.strengths_sum,
        cycle_to_update_sum: next_cycle_to_update_sum
    }
  end

  defp attempt_to_update_sum(acc) do
    acc
  end
end
