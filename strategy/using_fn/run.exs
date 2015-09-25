# start server with default formatter
{:ok, _} = Report.start_link(fn context ->
    IO.puts "<html>"
    IO.puts "  <head>"
    IO.puts "    <title>#{context.title}</title>"
    IO.puts "  </head>"
    IO.puts "  <body>"

    Enum.each context.text, fn line ->
      IO.puts "    <p>#{line}</p>"
    end

    IO.puts "  </body>"
    IO.puts "</html>"
  end)

context = %{
  title: "Monthly Report",
  text: ["Things are going", "really, really well"]
}

Report.output_report(context)

# Change the formatter at runtime
Report.change_format(fn context ->
  IO.puts "***** #{context.title} *****"

  Enum.each(context.text, &IO.puts/1)
end)

Report.output_report(context)
