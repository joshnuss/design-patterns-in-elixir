defmodule Cooking do
  def part(name, ingredients),
    do: {:branch, name, ingredients}

  def ingredient(name, quantity, unit \\ :units),
    do: {:leaf, name, quantity, unit}
end
