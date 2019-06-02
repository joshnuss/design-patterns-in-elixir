# start server with default formatter
html = fn context ->
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

plain_text = fn context ->
  IO.puts("***** #{context.title} *****")
  Enum.each(context.text, &IO.puts/1)
end

context = %{
  title: "Monthly Report",
  text: ["Things are going", "really, really well"]
}

{:ok, _} = Report.start_link(html)

Report.output_report(context)

# Change the formatter at runtime
Report.change_format(plain_text)
Report.output_report(context)
