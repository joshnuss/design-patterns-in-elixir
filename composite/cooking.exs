defmodule Cooking do
  def ingredient(name, quantity, unit \\ :units),
    do: {:ingredient, name, quantity, unit}

  def part(name, ingredients),
    do: {:part, name, ingredients}
end
