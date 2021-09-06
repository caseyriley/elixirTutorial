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
