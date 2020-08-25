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
  def rember_v1(a, lat) do
    cond do
      null? lat -> []
      true -> cond do
        eq?(car(lat), a) -> cdr lat
        true -> rember_v1(a, cdr(lat))
      end
    end
  end

  #defdelegate rember(a, lat), to: __MODULE__, as: :rember_v1

  def rember(a, lat) do
    cond do
      null? lat -> []
      eq?(car(lat), a) -> cdr lat
      true -> cons(car(lat),
                   rember(a, cdr(lat)))

    end
  end

  def firsts(lat) do
    cond do
      null? lat -> []
      true -> cons car(car(lat)),
                    firsts(cdr(lat))
    end
  end

  def insertR(new, old, lat) do
    cond do
      null? lat -> []
      eq? car(lat), old -> cons(old,
                                cons(new,
                                    cdr(lat)))
      true -> cons(car(lat),
                   insertR(new, old, cdr(lat)))
    end
  end

  # 忍不住用 Pattern Matching， 清楚多了
  def insertL(new, old, lat) do
    case lat do
      [] -> []
      [^old | _cdr_of_old] -> [new | lat]
      [h | cdr_of_old] -> [h | insertL(new, old, cdr_of_old)]
    end
  end

  def subst_in_scheme(new, old, lat) do
    cond do
      null? lat -> []
      eq? car(lat), old -> cons(new, cdr(lat))
      true -> cons(car(lat),
                   subst_in_scheme(new, old, cdr(lat)))
    end
  end
  def subst(new, old, lat) do
    case lat do
      [] -> []
      [^old | rest] -> [new | rest]
      [head | rest] -> [head | subst(new, old, rest)]
    end
  end
end
