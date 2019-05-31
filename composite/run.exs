# Import the `part/2` and `ingredient/3` functions
import Cooking

# Define the cake, the root is a branch
cake =
  part(:cake, [
    # First part is the batter which is a "branch"
    # it has several ingredients, which are "leaves"
    part(:batter, [
      ingredient(:flour, 1, :cups),
      ingredient(:sugar, 0.5, :cups),
      ingredient(:eggs, 2)
    ]),

    # Second branch is the frosting, with 2 leaves
    part(:frosting, [
      ingredient(:sugar, 100, :grams),
      ingredient(:lemon_juice, 2, :tbl)
    ])
  ])

IO.inspect(cake, label: "Your birthday cake")
