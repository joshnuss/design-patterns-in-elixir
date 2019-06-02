defmodule PlainTextReport do
  use Report

  def output_head,
    do: IO.puts("**** #{@title} ****\n")

  def output_line(line),
    do: IO.puts(line)
end
