fred = %Employee{name: "Fred Flinstone", title: "Crane Operator", salary: 30000}

{:ok, pid} = GenEvent.start_link()

HR.start_link(fred, pid)

GenEvent.add_handler(pid, Payroll, [])
GenEvent.add_handler(pid, TaxMan, [])

HR.update(%{salary: 35000})
