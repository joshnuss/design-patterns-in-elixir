defmodule HTMLReport do
  use Report

  def output_start,
    do: IO.puts("<html>")

  def output_head do
    IO.puts("  <head>")
    IO.puts("    <title>#{@title}</title>")
    IO.puts("  </head>")
  end

  def output_body_start,
    do: IO.puts("<body>")

  def output_line(line),
    do: IO.puts("  <p>#{line}</p>")

  def output_body_end,
    do: IO.puts("</body>")

  def output_end,
    do: IO.puts("</html>")
end
