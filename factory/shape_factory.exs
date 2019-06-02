# Factories are responsible for constructing things
#
# They are useful when you construct similar things in many places
# or when you don't want to make the caller responsible for understanding how to construct (if it's complicated)
defmodule ShapeFactory do
  # The factory pattern matches to create different things
  def create(:circle, %{diameter: diameter}), do: {:circle, diameter}
  def create(:circle, %{radius: radius}), do: {:circle, radius * 2}

  # We can construct rectangles in 2 different ways
  def create(:rectangle, %{width: width, height: height}), do: {:rectangle, width, height}
  def create(:rectangle, %{x1: x1, x2: x2, y1: y1, y2: y2}), do: {:rectangle, x2 - x1, y2 - y1}

  # We create rectangles when asked for a square (mathimatically wrong, but whatevs)
  def create(:square, %{size: size}), do: {:rectangle, size, size}
end
