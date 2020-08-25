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

  test "test chapter 3, rember v1, error version" do
    assert rember_v1(:a, [:a, :b, :c]) == [:b, :c]
    assert rember_v1(:a, []) == []
    assert rember_v1(:a, [:b]) == []
    assert rember_v1(:b, [:a, :b, :c]) == [:c]
  end
  test "test chapter 3, rember" do
    assert rember(:a, [:a, :b, :c]) == [:b, :c]
    assert rember(:a, []) == []
    assert rember(:a, [:b]) == [:b]
    assert rember(:b, [:a, :b, :c]) == [:a, :c]
  end

  test "test chapter 3, firsts" do
    assert firsts([]) == []
    assert firsts([[:a, :b], [:c, :d], [:e]]) == [:a, :c, :e]
  end
end
