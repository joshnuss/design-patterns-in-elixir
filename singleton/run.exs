defmodule Singleton do
  use GenServer

  # for a singleton specific to this node
  @name :the_singleton_name

  # for a singleton across all nodes
  # @name {:global, :the_singleton_name}

  @initial_value "starting value"

  def start_link,
    do: GenServer.start_link(__MODULE__, @initial_value, name: @name)

  def value,
    do: GenServer.call(@name, :read)

  def update(value),
    do: GenServer.call(@name, {:write, value})

  def handle_call(:read, _from, value),
    do: {:reply, value, value}

  def handle_call({:write, value}, _from, _old_value),
    do: {:reply, :ok, value}
end

Singleton.start_link()

Singleton.value() |> IO.puts()
Singleton.update("new value")
Singleton.value() |> IO.puts()
