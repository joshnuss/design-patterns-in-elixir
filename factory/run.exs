factory = ShapeFactory

circle = factory.create(:circle, %{diameter: 10})
Graphics.draw(circle)

square = factory.create(:square, %{size: 20})
Graphics.draw(square)

rectangle = factory.create(:rectangle, %{width: 5, height: 15})
Graphics.draw(rectangle)
