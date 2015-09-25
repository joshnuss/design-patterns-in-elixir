defmodule PlainTextFormatter do
   def output_report(context) do
    IO.puts "***** #{context.title} *****"

    Enum.each(context.text, &IO.puts/1)
  end
end
