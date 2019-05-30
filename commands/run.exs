# Start the runner
Runner.start_link()

# Make a list of commands
# Each is a tuple of command module and arg list
commands = [
  {CreateFile, ["file1.txt", "hello world"]},
  {CopyFile, ["file1.txt", "file2.txt"]},
  {DeleteFile, "file1.txt"}
]

# Execute the commands
Runner.execute(commands)

# Sleep a bit to simulate work
Process.sleep(2000)

IO.puts("....undoing....")

# Undo all 3 commands
Runner.undo()
Runner.undo()
Runner.undo()

# Sleep a bit to simulate work
Process.sleep(2000)

IO.puts("....redoing....")

# Redo all 3 commands
Runner.redo()
Runner.redo()
Runner.redo()
