defmodule Payroll do
  use GenEvent

  def handle_event({:changed, employee}, _) do
    IO.puts "Cut a new check for #{employee.name}!"
    IO.puts "His salary is now #{employee.salary}!"

    {:ok, nil}
  end
end
