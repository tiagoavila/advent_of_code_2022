defmodule DayEleven do
  alias DayEleven.MonkeyServer

  defmodule MonkeyData do
    defstruct [
      :monkey,
      :start_items,
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
    input
    |> String.split("\n\n", trim: true)
    |> Enum.map(fn monkey_row ->
      monkey_row
      |> String.split("\n", trim: true)
      |> Enum.map(&String.trim_leading(&1))
      |> create_monkey_data()
    end)
    |> Map.new(fn %MonkeyData{monkey: monkey} = monkey_data ->
      server_name = String.to_atom("monkey-#{monkey}")
      {:ok, pid} = GenServer.start_link(MonkeyServer, monkey_data, name: server_name)
      {server_name, pid}
    end)
  end

  defp create_monkey_data([
         <<"Monkey ", monkey::binary-1, ":">>,
         "Starting items: " <> items,
         <<"Operation: new = old ", op::binary-1, " ", operand::binary>>,
         "Test: divisible by " <> test,
         "If true: throw to monkey " <> true_monkey,
         "If false: throw to monkey " <> false_monkey
       ]) do
    start_items = String.split(items, ", ", trim: true)

    operation_function =
      case {op, operand} do
        {"*", "old"} -> fn old -> old * old end
        {"+", operand} -> fn old -> old + String.to_integer(operand) end
        {"*", operand} -> fn old -> old * String.to_integer(operand) end
      end

    %MonkeyData{
      monkey: monkey,
      start_items: start_items,
      operation_function: operation_function,
      test: String.to_integer(test),
      if_true: true_monkey,
      if_false: false_monkey,
      inspect_count: 0
    }
  end
end
