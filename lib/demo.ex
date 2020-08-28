defmodule Demo do
  def hi do
    IO.puts("out")
    x = "1"
    IO.puts(x)
    if true do
      IO.puts("in do")
      IO.puts(x)
      x = "2"
      IO.puts(x)
    end
    IO.puts("out do")
    IO.puts(x)
    x
  end
end
