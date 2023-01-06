defmodule DayEleven do
  alias Inspect.Regex
	defmodule MonkeyData do
		defstruct [:start_items, :operation, :test, :if_true, :if_false]
	end

	def get_level_of_monkey_business(input) do
		input
		|> String.split("\n\n", trim: true)
		|> Enum.map(&create_monkey_data/1)
		# |> Map.new(fn monkey_row -> create_monkey_data(monkey_row) end)
	end

	defp create_monkey_data(monkey_row) do
		# Regex.scan(~r/^Monkey (\d+):
		# Starting items: (.+)
		# Operation: new = (.+)
		# Test: (.+)
		# 	If true: throw to monkey (\d+)
		# 	If false: throw to monkey (\d+)$/m, monkey_row)

		Regex.scan(~r/c(d|e)/, "abcd abce", [])


		monkey_row
	end
end
