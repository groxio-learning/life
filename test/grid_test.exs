defmodule GridTest do
  use ExUnit.Case
  alias Life.Grid

  test "neighbors" do
    grid = Grid.new(:unused)
    neighbors = Grid.neighbors(grid, {2, 2})
    assert Enum.sort(neighbors) ==
      [false, false, false, false, false, false, true, true]
  end

  test "count neighbors" do
    grid = Grid.new(:unused)
    Grid.count_neighbors(grid, {2, 2}) == 2
  end



end
