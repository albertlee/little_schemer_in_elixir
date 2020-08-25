# Little Schemer in Elixir

## By, hanzhupeng@gmail.com

《The Little Schemer》 in Elixir.

个人的练习项目。

代码在 lib/little.ex 里，示例程序在 test/little_test.exs里。

执行：

```shell
mix test
```

用Elixir语法上不能做到与书里的Scheme完全对应，主要是练个思路。倒是可以作为一个元编程的挑战，看看能不能用macro，把 elixir改造的更像scheme（好无聊）

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
```
