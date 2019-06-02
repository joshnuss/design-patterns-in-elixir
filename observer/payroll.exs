defmodule Payroll do
  use GenEvent

  def handle_event({:changed, employee}, state) do
    IO.puts("Cut a new check for #{employee.name}!")
    IO.puts("His salary is now #{employee.salary}!")

    {:ok, state}
  end
end
