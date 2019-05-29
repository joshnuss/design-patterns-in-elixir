# Import the builder
import ComputerBuilder

# Building the computer is done in a sequence of immutable steps
#
# - Each function takes a `Computer` as the first parameter
# - Each function returns a new `Computer` struct
#
# It allows us to chain the steps together using pipes `|>` and save the last value
computer =
  base_model()
  |> intel
  |> display(:lcd)
  |> set_memory(12_000_000_000)
  |> add_cd
  |> add_dvd
  |> add_hard_disk(256_000_000_000)

# Print it out
IO.inspect(computer, label: "Your brand new computer")
