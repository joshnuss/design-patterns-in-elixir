defmodule PlainTextFormatter do
  @behaviour Formatter

  def output_report(context) do
    IO.puts("***** #{context.title} *****")

    Enum.each(context.text, &IO.puts/1)
  end
end
