# Each command is a module with an `execute` and `unexecute` function
#
# `execute` runs the command in forward direction
# `unexecute` runs the command in reverse direction
#
# All the state is passed in parameters to `execute`/`unexecute`
defmodule CopyFile do
  def execute(source, destination) do
    IO.puts("cp #{source} #{destination}")
  end

  def unexecute(_source, destination) do
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
