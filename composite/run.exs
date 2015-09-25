import Cooking

batter = part(:batter, [
  ingredient(:flour, 1, :cups),
  ingredient(:sugar, 0.5, :cups),
  ingredient(:eggs, 2)
])

frosting = part(:frosting, [
  ingredient(:sugar, 100, :grams),
  ingredient(:lemon_juice, 2, :tbl)
])

cake = part(:cake, [batter, frosting])

IO.inspect(cake)
