defmodule TaxMan do
  use GenEvent

  def handle_event({:changed, employee}, _) do
    IO.puts "Send #{employee.name} a new tax bill!"

    {:ok, nil}
  end
end
