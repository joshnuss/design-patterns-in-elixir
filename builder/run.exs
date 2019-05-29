# Import the builder
import ComputerBuilder

# Building the computer is done in a sequence
#
# - Each build step takes a `Computer` as the first parameter
# - Each build step also returns a `Computer` struct
#
# This allows us to chain the steps together using pipes `|>`
computer =
  base_model()
  |> intel
  |> display(:lcd)
  |> set_memory(12_000_000_000)
  |> add_cd
  |> add_dvd
  |> add_hard_disk(256_000_000_000)

# The last value of the pipe is your new computer!
IO.inspect(computer, label: "Your brand new computer")
