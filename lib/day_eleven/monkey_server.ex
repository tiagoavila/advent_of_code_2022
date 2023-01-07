defmodule DayEleven.MonkeyServer do
  use GenServer

  # Client Interface

  # def start(monkey_data)do
  #   IO.puts "Starting the Monkey server..."
  #   GenServer.start_link(__MODULE__, monkey_data, name: __MODULE__)
  # end

  # Server Callbacks

  def init(state) do
    {:ok, state}
  end

  def handle_call({:catch, item}, from, state) do
    IO.puts("Thanks for sending me the item #{item} monkey: #{inspect(from)}")
    {:reply, "hey monkey", state}
  end
end
