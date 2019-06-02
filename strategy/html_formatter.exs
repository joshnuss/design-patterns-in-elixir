defmodule HTMLFormatter do
  @behaviour Formatter

  def output_report(context) do
    IO.puts("<html>")
    IO.puts("  <head>")
    IO.puts("    <title>#{context.title}</title>")
    IO.puts("  </head>")
    IO.puts("  <body>")

    Enum.each(context.text, fn line ->
      IO.puts("    <p>#{line}</p>")
    end)

    IO.puts("  </body>")
    IO.puts("</html>")
  end
end
