defmodule HR do
  use GenServer

  def start_link(employee, events) do
    state = %{events: events, employee: employee}

    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def handle_call({:update, changes}, _from, state) do
    updated = Map.merge(state.employee, changes)

    GenEvent.notify(state.events, {:changed, updated})

    {:reply, :ok, %{state | employee: updated}}
  end

  def update(changes),
    do: GenServer.call(__MODULE__, {:update, changes})
end
