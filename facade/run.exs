# A facade is a portal into a sub-system
# It encapsulated a sub system
# It hides implementation details from consumers
# It acts as a contract between subsystems

# Private implementation details
defmodule Shipping.Packages do
  def options do
    [envelope: 1, box: 2]
  end
end

# More private implementation details
defmodule Shipping.Rates do
  def compute do
    [fedex: 1, ups: 2, usps: 0, dhl: 1]
  end
end

# Facade delegate to underlying components, that means consumers
# don't need to know about the underlying components
defmodule Shipping do
  defdelegate package_options, to: Shipping.Packages, as: :options
  defdelegate compute_rates, to: Shipping.Rates, as: :compute
end

# Call facade and print it
Shipping.package_options() |> IO.inspect(label: "Packages")
Shipping.compute_rates() |> IO.inspect(label: "Rates")
