defmodule Graphics do
  def draw({:circle, d}),
    do: IO.puts("Drawing circle, diameter: #{d}")

  def draw({:rectangle, w, h}),
    do: IO.puts("Drawing rectangle, dimensions: #{w}*#{h}")
end
