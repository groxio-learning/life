defmodule LifeTest do
  use ExUnit.Case
  doctest Life

  test "greets the world" do
    assert Life.hello() == :world
  end
end
