# Define a module with a list of build actions
defmodule ComputerBuilder do
  # Start with a blank computer
  def base_model,
    do: %Computer{}

  # Define some methods to configure the CPU
  def intel(computer),
    do: %{computer | cpu: :intel}

  # We can use pattern matching
  def amd(computer = %Computer{cpu: nil}),
    do: %{computer | cpu: :amd}

  # We can use guards
  def display(computer, type) when type in ~w(lcd hd wxga)a,
    do: %{computer | display: type}

  # We can overwrite values
  def set_memory(computer, size),
    do: %{computer | memory: size}

  # Or we can append values to arrays, using the `[head|tail]` syntax
  def add_disk(computer, drive),
    do: %{computer | drives: [drive | computer.drives]}

  def add_hard_disk(computer, size),
    do: add_disk(computer, size)

  # Actions can rely on other actions. Here `add_cd` is based on `add_disk`
  def add_cd(computer),
    do: add_disk(computer, :cd)

  def add_dvd(computer),
    do: add_disk(computer, :dvd)
end
