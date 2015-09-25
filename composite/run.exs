import Cooking

cake = part(:cake, [
  part(:batter, [
    ingredient(:flour, 1, :cups),
    ingredient(:sugar, 0.5, :cups),
    ingredient(:eggs, 2)
  ]),

  part(:frosting, [
    ingredient(:sugar, 100, :grams),
    ingredient(:lemon_juice, 2, :tbl)
  ])
])

IO.inspect(cake)
