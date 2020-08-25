# Little Schemer in Elixir

## By, hanzhupeng@gmail.com

《The Little Schemer》 in Elixir.

个人的练习项目。复习 Little Schemer里的递归处理的思路，同时练习熟悉 Elixir 里的方便语法。用Elixir语法上不能做到与书里的Scheme完全对应，主要是练个思路。倒是可以作为一个元编程的挑战，看看能不能用macro，把 elixir改造的更像scheme。好无聊，后面写着写着就忍不住用Pattern Matching了，何苦自虐呢。

代码在 lib/little.ex 里，示例程序在 test/little_test.exs里。

程序执行：

```shell
mix test

iex -S mix
```

```elixir
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

```

用 Pattern Matching就是爽啊，对比下：

```elixir
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
```

