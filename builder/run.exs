import ComputerBuilder

computer = build()
           |> intel
           |> display(:lcd)
           |> set_memory(12_000_000_000)
           |> add_cd
           |> add_dvd
           |> add_hard_disk(256_000_000_000)

IO.puts "Your new computer: #{inspect computer}"
