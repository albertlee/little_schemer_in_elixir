defmodule LittleTest do
  use ExUnit.Case
  import Little
  doctest Little

  test "test chapter 1, " do
    assert car([:a, :b]) == :a
    assert cdr([:a, :b]) == [:b]
    assert cons(:a, [:b, :c]) == [:a, :b, :c]
  end

  test "test chapter 1, atom?" do
    assert atom?([:a]) == false
    l = [:a, :b, :c]
    assert atom?(car(l)) == true
  end

  test "test chapter 1, c" do
    assert eq?(:a, :b) == false

    l = [:mary, :had, :a, :little, :lamb, :chop]
    a = :mary
    assert eq?(car(l), a) == true
  end

  test "test chapter 2, lat?" do
    assert lat?([:a, :b]) == true
    assert lat?([:a, [:b]]) == false
  end

  test "test chapter 2, member?" do
    assert member?(:a, [:a, :b]) == true
    assert member?(:a, [:b, :c]) == false
  end
end
