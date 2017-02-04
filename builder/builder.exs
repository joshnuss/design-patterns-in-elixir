defmodule ComputerBuilder do
  def build,
    do: %Computer{}

  def intel(computer),
    do: %{computer | cpu: :intel}

  def amd(computer),
    do: %{computer | cpu: :amd}

  def display(computer, type) when type in ~w(lcd hd wxga)a,
    do: %{computer | display: type}

  def set_memory(computer, size),
    do: %{computer | memory: size}

  def add_disk(computer, drive),
    do: %{computer | drives: [drive|computer.drives]}

  def add_hard_disk(computer, size),
    do: add_disk(computer, size)

  def add_cd(computer),
    do: add_disk(computer, :cd)

  def add_dvd(computer),
    do: add_disk(computer, :dvd)
end
