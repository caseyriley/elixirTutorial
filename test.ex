IO.puts "Hello World" ; IO.puts "Bye"
defmodule Greeter do
  def hello(name, country \\ "en") do
     phrase(country) <> name
  end

  defp phrase("en"), do: "Hello, "
  defp phrase("es"), do: "Hola, "
end

Greeter.hello("Ayush", "en")
Greeter.hello("Ayush")
Greeter.hello("Ayush", "es")


#recursive function for printing each item in a list
a = ["Hey", 100, 452, :true, "People"]
defmodule ListPrint do
   def print([]) do
   end
   def print([head | tail]) do
      IO.puts(head)
      print(tail)
   end
end

ListPrint.print(a)

#looping with recursion
defmodule Loop do
  def print_multiple_times(msg, n) when n <= 1 do
     IO.puts msg
  end

  def print_multiple_times(msg, n) do
     IO.puts msg
     print_multiple_times(msg, n - 1)
  end
end

Loop.print_multiple_times("Hello", 10)

#Enum.all?
res = Enum.all?([1, 2, 3, 4], fn(s) -> rem(s,2) == 1 end)
IO.puts(res)
