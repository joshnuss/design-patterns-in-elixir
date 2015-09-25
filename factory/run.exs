defmodule ShapeFactory do
  def create(:circle, diameter: diameter), do: {:circle, diameter}
  def create(:circle, radius: radius), do: {:circle, radius*2}

  def create(:rectangle, width: width, height: height), do: {:rectangle, width, height}
  def create(:rectangle, x1: x1, x2: x2, y1: y1, y2: y2), do: {:rectangle, x2-x1, y2-y1}

  def create(:square, size: size), do: {:square, size}
end

defmodule Graphics do
  def draw({:circle, d}),
    do: IO.puts("Drawing circle, diameter: #{d}")
  def draw({:rectangle, w, h}),
    do: IO.puts("Drawing rectangle, dimensions: #{w}*#{h}")
  def draw({:square, size}),
    do: IO.puts("Drawing square, dimensions: #{size}*#{size}")
end

factory = ShapeFactory

circle = factory.create(:circle, diameter: 10)
Graphics.draw(circle)

square = factory.create(:square, size: 20)
Graphics.draw(square)

rectangle = factory.create(:rectangle, width: 5, height: 15)
Graphics.draw(rectangle)
