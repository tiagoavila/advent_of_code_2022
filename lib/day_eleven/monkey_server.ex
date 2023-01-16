defmodule DayEleven.MonkeyServer do
  use GenServer

  # Client Interface

  @spec throw_item_to_monkey(atom | pid | {atom, any} | {:via, atom, any}, any) :: :ok
  def throw_item_to_monkey(monkey, item), do: GenServer.cast(monkey, {:catch, item})

  def do_monkey_turn(monkey), do: GenServer.call(monkey, {:inspect_items})

  def report_inspect_count(monkey), do: GenServer.call(monkey, {:report_inspect_count})

  # ===================================================================================================

  # Server Callbacks

  @spec init(any) :: {:ok, any}
  def init(monkey) do
    {:ok, monkey}
  end

  def handle_cast({:catch, item}, monkey_data) do
    # IO.puts("From #{monkey_data.monkey}: Thanks for sending me the item #{item}")

    updated_monkey_state = %DayEleven.MonkeyData{monkey_data | items: [item | monkey_data.items]}
    {:noreply, updated_monkey_state}
  end

  def handle_call({:inspect_items}, _from, monkey_data) do
    # IO.puts("From #{monkey_data.monkey}: All right, I'll inspect my items")

    updated_monkey_data = inspect_items_and_throw(monkey_data)

    {:reply, updated_monkey_data, updated_monkey_data}
  end

  def handle_call({:report_inspect_count}, _from, monkey_data) do
    # IO.puts("From #{monkey_data.monkey}: All right, I'll report my count of items I inspected")

    {:reply, monkey_data.inspect_count, monkey_data}
  end

  # ===================================================================================================

  # Business Logic

  defp inspect_items_and_throw(monkey_data) do
    monkey_data.items
    |> Enum.reverse()
    |> Enum.each(fn item ->
      worry_level =
        if monkey_data.decrease_worry_level == true,
          do: monkey_data.operation_function.(item) |> div(3),
          else: monkey_data.operation_function.(item)

      monkey_to_throw =
        if rem(worry_level, monkey_data.test) == 0 do
          monkey_data.if_true
        else
          monkey_data.if_false
        end

      throw_item_to_monkey(monkey_to_throw, worry_level)
    end)

    %DayEleven.MonkeyData{
      monkey_data
      | inspect_count: monkey_data.inspect_count + Enum.count(monkey_data.items),
        items: []
    }
  end
end
