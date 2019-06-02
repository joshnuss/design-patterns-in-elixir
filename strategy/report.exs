defmodule Report do
  use GenServer

  def start_link(formatter) do
    GenServer.start_link(__MODULE__, formatter, name: __MODULE__)
  end

  def init(formatter),
    do: {:ok, formatter}

  def handle_call({:output_report, context}, _from, formatter) do
    formatter.output_report(context)

    {:reply, :ok, formatter}
  end

  def handle_call({:change_format, new_formatter}, _from, _state),
    do: {:reply, :ok, new_formatter}

  # Public APIs
  def output_report(context),
    do: GenServer.call(__MODULE__, {:output_report, context})

  def change_format(formatter),
    do: GenServer.call(__MODULE__, {:change_format, formatter})
end
