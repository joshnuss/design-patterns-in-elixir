# A GenServer is used to hold a stack of each command
#
# There are 2 stacks/lists:
# - The `done` stack tracks commands that have been executed
# - The `undone` stack tracks command that have been undone.
#     This allows to undo and later redo commands.
#
# We can undo or redo any command
defmodule Runner do
  # Using the GenServer DSL
  use GenServer

  # Start the GenServer
  def start_link do
    # start with an empty `done` & `undone` stack
    state = %{done: [], undone: []}

    # Start 'er up
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  # Not doing anything during initialization, just return the state
  def init(state) do
    {:ok, state}
  end

  # `execute` calls the GenServer and passes the list of `commands` to execute
  def execute(commands),
    do: GenServer.call(__MODULE__, {:execute, commands})

  # `undo` calls the GenServer, which will undo one command
  def undo(),
    do: GenServer.call(__MODULE__, :undo)

  # `redo` calls the GenServer, which will redo one command
  def redo(),
    do: GenServer.call(__MODULE__, :redo)

  # handles the `execute` message
  def handle_call({:execute, commands}, _from, state) do
    # wrap the commands into a list
    # in case a single command was passed
    commands = List.wrap(commands)

    # iterate the list of commands
    # each command is a tuple with module (ie `CopyFile`) and arg list (ie `["foo.txt"]`)
    Enum.each(commands, fn {mod, args} ->
      apply(mod, :execute, List.wrap(args))
    end)

    # add the commands to the `done` stack
    new_state = %{state | done: Enum.reverse(commands) ++ state.done}

    # reply `:ok` and update the state to `new_state`
    {:reply, :ok, new_state}
  end

  # handles the `undo` message
  # pattern matches the `done` list, extracting the first command and the tail
  def handle_call(:undo, _from, state = %{done: [command = {mod, args} | t]}) do
    # dynamically call `unexecute` on the commmand module
    apply(mod, :unexecute, List.wrap(args))

    # update the `done` stack to the tail
    # move the command to the `undone` list, in case we want to redo the command later
    new_state = %{state | done: t, undone: [command | state.undone]}

    # reply `:ok` and update the state to `new_state`
    {:reply, :ok, new_state}
  end

  # handles the `redo` message
  # pattern matches the `undone` list, extracting the first command and the tail
  def handle_call(:redo, _from, state = %{undone: [command = {mod, args} | t]}) do
    # dynamically call `execute` on the commmand module
    apply(mod, :execute, List.wrap(args))

    # update the `undone` stack to the tail
    # move the command to the `done` list, in case we want to undo the command later
    new_state = %{state | undone: t, done: [command | state.done]}

    # reply `:ok` and update the state to `new_state`
    {:reply, :ok, new_state}
  end
end
