# Private implementation details
defmodule MySystem.ComponentA do
  def a do
    IO.puts "component a"
  end
end

# More private implementation details
defmodule MySystem.ComponentB do
  def b do
    IO.puts "component b"
  end
end

# Fascade delegate to underlying systems
defmodule MySystem do
  defdelegate a, to: MySystem.ComponentA
  defdelegate b, to: MySystem.ComponentB
end

MySystem.a()
MySystem.b()
