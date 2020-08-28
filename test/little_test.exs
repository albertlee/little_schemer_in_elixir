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

  test "test chapter 3, insertR" do
    assert insertR(:topping, :fudge, [:ice, :cream, :with, :fudge, :for, :dessert]) ==
      [:ice, :cream, :with, :fudge, :topping, :for, :dessert]

  end

  test "test chapter 3, insertL" do
    assert insertL(:a, :b, []) == []
    assert insertL(:a, :b, [:b]) == [:a, :b]
    assert insertL(:e, :f, [:a, :b, :c, :d, :f, :g]) == [:a, :b, :c, :d, :e, :f, :g]
  end

  test "test subst" do

    assert subst_in_scheme(:a, :b, []) == []
    assert subst_in_scheme(:a, :b, [:c]) == [:c]
    assert subst_in_scheme(:a, :b, [:c, :b, :e]) == [:c, :a, :e]

    assert subst(:a, :b, []) == []
    assert subst(:a, :b, [:c]) == [:c]
    assert subst(:a, :b, [:c, :b, :e]) == [:c, :a, :e]
  end
  test "test subst2" do
    assert subst2(:a, :b, :c, []) == []
    assert subst2(:a, :b, :c, [:c]) == [:a]
    assert subst2(:a, :b, :c, [:c, :b, :e]) == [:a, :b, :e]
  end

  test "test multirember" do
    assert multirember(:a, [:a]) == []
    assert multirember(:a, [:a, :a]) == []
    assert multirember(:a, [:b, :a, :a]) == [:b]
  end

  test "test multiinsertR" do
    assert multiinsertR(:a, :b, [:b, :c, :b]) == [:b, :a, :c, :b, :a]
    assert multiinsertR(:a, :b, [:c]) == [:c]
    assert multiinsertR(:a, :b, []) == []
  end

  test "test multiinsertL" do
    assert multiinsertL(:a, :b, [:b, :c, :b]) == [:a, :b, :c, :a, :b]
    assert multiinsertL(:a, :b, [:c]) == [:c]
    assert multiinsertL(:a, :b, []) == []
  end

  test "test multisubst" do
    assert multisubst(:a, :b, [:b, :c, :b]) == [:a, :c, :a]
    assert multisubst(:a, :b, [:c]) == [:c]
    assert multisubst(:a, :b, []) == []
  end
end
