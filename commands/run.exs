defmodule CopyFile do
  def execute(source, destination) do
    IO.puts("cp #{source} #{destination}")
  end

  def unexecute(source, destination) do
    IO.puts("rm #{destination}")
  end
end

defmodule CreateFile do
  def execute(path, data) do
    IO.puts(~s|echo "#{data}" > #{path}|)
  end

  def unexecute(path, _data) do
    IO.puts("mv #{path} /path/to/trash")
  end
end

defmodule DeleteFile do
  def execute(path) do
    IO.puts("mv #{path} /path/to/trash")
  end

  def unexecute(path) do
    IO.puts("mv /path/to/trash/#{Path.basename(path)} #{path}")
  end
end

defmodule Runner do
  use GenServer

  def start_link do
    state = %{done: [], undone: []}

    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def execute(commands),
    do: GenServer.call(__MODULE__, {:execute, commands})

  def undo(),
    do: GenServer.call(__MODULE__, :undo)

  def redo(),
    do: GenServer.call(__MODULE__, :redo)


  def handle_call({:execute, commands}, _from, state) do
    commands = List.wrap(commands)

    Enum.each commands, fn command ->
      {mod, args} = command
      apply(mod, :execute, List.wrap(args))
    end

    {:reply, :ok, %{state | done: Enum.reverse(commands) ++ state.done}}
  end

  def handle_call(:undo, _from, state=%{done: [command|t]}) do
    {mod, args} = command
    apply(mod, :unexecute, List.wrap(args))

    state = %{state | done: t, undone: [command | state.undone]}

    {:reply, :ok, state}
  end

  def handle_call(:redo, _from, state=%{undone: [command|t]}) do
    {mod, args} = command
    apply(mod, :execute, List.wrap(args))

    state = %{state | undone: t, done: [command | state.done]}

    {:reply, :ok, state}
  end
end

Runner.start_link

commands = [
  {CreateFile, ["file1.txt", "hello world"]},
  {CopyFile, ["file1.txt", "file2.txt"]},
  {DeleteFile, "file1.txt"}
]

Runner.execute(commands)

:timer.sleep(2000)

IO.puts "....undoing...."

Runner.undo
Runner.undo
Runner.undo

:timer.sleep(2000)

IO.puts "....redoing...."

Runner.redo
Runner.redo
Runner.redo
