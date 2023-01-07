defmodule DayEleven.MonkeyServer do
  use GenServer

  # Client Interface

  @spec throw_item_to_monkey(atom | pid | {atom, any} | {:via, atom, any}, any) :: :ok
  def throw_item_to_monkey(monkey, item), do: GenServer.cast(monkey, {:catch, item})

  def do_monkey_turn(monkey), do: GenServer.call(monkey, {:inspect_items})

  # ===================================================================================================


  # Server Callbacks

  @spec init(any) :: {:ok, any}
  def init(monkey) do
    {:ok, monkey}
  end

  def handle_cast({:catch, item}, monkey_data) do
    IO.puts("From #{monkey_data.monkey}: Thanks for sending me the item #{item}")

    updated_monkey_state = %DayEleven.MonkeyData{monkey_data | items: [item | monkey_data.items]}
    {:noreply, updated_monkey_state}
  end

  def handle_call({:inspect_items}, _from, monkey_data) do
    IO.puts("From #{monkey_data.monkey}: All right, I'll inspect my items")



    {:reply, monkey_data, monkey_data}
  end

  # ===================================================================================================

  defp inspect_items_and_throw(monkey_data) do
    monkey_data.items
    |> Enum.reduce(0, fn args -> 1 end)
  end
end
