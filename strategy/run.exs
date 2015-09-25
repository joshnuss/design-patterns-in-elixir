# start server with default formatter
{:ok, _} = Report.start_link(HTMLFormatter)

context = %{
  title: "Monthly Report",
  text: ["Things are going", "really, really well"]
}

Report.output_report(context)

# Change the formatter at runtime
Report.change_format(PlainTextFormatter)
Report.output_report(context)
