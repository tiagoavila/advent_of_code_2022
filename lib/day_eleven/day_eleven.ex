defmodule DayEleven do
  alias DayEleven.MonkeyServer

  # DayEleven.run_test()
  # GenServer.call(:"monkey-3", {:catch, "09"})

  defmodule MonkeyData do
    defstruct [
      :monkey,
      :items,
      :operation_function,
      :test,
      :if_true,
      :if_false,
      :inspect_count
    ]
  end

  def run_test() do
    File.read!("./inputs/day_eleven/test_input.txt")
    |> DayEleven.get_level_of_monkey_business()
  end

  def get_level_of_monkey_business(input) do
    monkeys =
      input
      |> String.split("\n\n", trim: true)
      |> Enum.map(&parse_monkey_row/1)
      |> Enum.map(fn %MonkeyData{monkey: monkey} = monkey_data ->
        {:ok, _pid} = GenServer.start_link(MonkeyServer, monkey_data, name: monkey)
        monkey
      end)

    monkeys
    |> Stream.cycle()
    |> Enum.take(20)
    |> Enum.each(fn args -> args end)
  end

  defp parse_monkey_row(monkey_row) do
    monkey_row
    |> String.split("\n", trim: true)
    |> Enum.map(&String.trim_leading(&1))
    |> create_monkey_data()
  end

  defp create_monkey_data([
         <<"Monkey ", monkey::binary-1, ":">>,
         "Starting items: " <> items,
         <<"Operation: new = old ", op::binary-1, " ", operand::binary>>,
         "Test: divisible by " <> test,
         "If true: throw to monkey " <> true_monkey,
         "If false: throw to monkey " <> false_monkey
       ]) do
    start_items = String.split(items, ", ", trim: true) |> Enum.map(&String.to_integer/1)

    operation_function =
      case {op, operand} do
        {"*", "old"} -> fn old -> old * old end
        {"+", operand} -> fn old -> old + String.to_integer(operand) end
        {"*", operand} -> fn old -> old * String.to_integer(operand) end
      end

    %MonkeyData{
      monkey: String.to_atom("monkey-#{monkey}"),
      items: start_items,
      operation_function: operation_function,
      test: String.to_integer(test),
      if_true: String.to_atom("monkey-#{true_monkey}"),
      if_false: String.to_atom("monkey-#{false_monkey}"),
      inspect_count: 0
    }
  end
end
