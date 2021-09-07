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

#Enum.all? #check if all are odd
res = Enum.all?([1, 2, 3, 4], fn(s) -> rem(s,2) == 1 end)
IO.puts(res)

#Enum.any? #check if any are odd
res = Enum.any?([1, 2, 3, 4], fn(s) -> rem(s,2) == 1 end)
IO.puts(res)

#iterate over a collection without producing a new value
Enum.each(["Hello", "Every", "one"], fn(freaky) -> IO.puts(freaky) end)

#apply our function to each item and produce a new collection
res = Enum.map([2, 5, 3, 6], fn(a) -> a*2 end)
IO.puts(res)

#reduce our enumerable to a single value #5 is optional accumulator
res = Enum.reduce([1, 2, 3, 4], 5, fn(x, accum) -> x + accum end)
IO.puts(res)

#a pipeline of operations
odd? = &(odd? = &(rem(&1, 2) != 0)
res = 1..100_000 |> Enum.map(&(&1 * 3)) |> Enum.filter(odd?) |> Enum.sum
IO.puts(res)


#Understanding Protocols
#Defining the protocol
defprotocol Blank do
  def blank?(data)
end

#Implementing the protocol for lists
defimpl Blank, for: List do
  def blank?([]), do: true
  def blank?(_), do: false
end

#Implementing the protocol for strings
defimpl Blank, for: BitString do
  def blank?(""), do: true
  def blank?(_), do: false
end

#Implementing the protocol for maps
defimpl Blank, for: Map do
  def blank?(map), do: map_size(map) == 0
end

IO.puts(Blank.blank? [])
IO.puts(Blank.blank? [:true, "Hello"])
IO.puts(Blank.blank? "")
IO.puts(Blank.blank? "Hi")
