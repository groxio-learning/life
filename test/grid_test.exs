defmodule GridTest do
  use ExUnit.Case
  alias Life.Grid

  test "has neighbors" do
    grid = Grid.new(:unused)
    neighbors = Grid.has_neighbors(grid, {2, 2})

    assert Enum.sort(neighbors) ==
             [false, false, false, false, false, false, true, true]
  end

  test "count neighbors" do
    grid = Grid.new(:unused)
    Grid.count_neighbors(grid, {2, 2}) == 2
  end
end
