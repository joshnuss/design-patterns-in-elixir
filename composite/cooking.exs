# A composite is a tree data structure with branches and leaves
# You can form them using tuples or structs.
# Here we use tuples
defmodule Cooking do
  # A `part` is "branch", with an array of ingredients (aka leaves or children)
  def part(name, ingredients),
    do: {:branch, name, ingredients}

  # An `ingredient` is "leaf", it does not have any children elements
  def ingredient(name, quantity, unit \\ :units),
    do: {:leaf, name, quantity, unit}
end
