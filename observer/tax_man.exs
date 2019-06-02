defmodule TaxMan do
  use GenEvent

  def handle_event({:changed, employee}, state) do
    IO.puts("Send #{employee.name} a new tax bill!")

    {:ok, state}
  end
end
