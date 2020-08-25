defmodule Little do
  @moduledoc """
  The Little Schemer
  Elixir 版本练习
  示例代码见 little_test.exs
  """

  ## Chapter 1

  # hd, tl
  #def car([x|_]), do: x
  #def cdr([_|vals]), do: vals
  def cons(aVal, aList), do: [aVal | aList]
  #def null?(x), do: Enum.empty?(x)
  defdelegate null?(v), to: Enum, as: :empty?
  defdelegate car(v), to: Kernel, as: :hd
  defdelegate cdr(v), to: Kernel, as: :tl

  defdelegate atom?(v), to: Kernel, as: :is_atom
  defdelegate eq?(v1, v2), to: Kernel, as: :==

  ## Chapter 2
  def lat?(l) do
    cond do
      null?(l) -> true
      atom?(car(l)) -> lat?(cdr(l))
      true -> false
    end
  end

  # Kernel.in
  def member?(a, lat) do
    cond do
      null? lat -> false
      true -> eq?(car(lat), a)
              or
              member?(a, cdr(lat))
    end
  end

  ## Chapter 3

end
