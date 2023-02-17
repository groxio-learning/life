defmodule GridTest do
  use ExUnit.Case
  alias Life.Grid

  test "has neighbors" do
    grid = new_grid()
    neighbors = Grid.has_neighbors(grid, {2, 2})

    assert Enum.sort(neighbors) ==
             [false, false, false, false, false, false, true, true]
  end

  test "count neighbors" do
    grid = new_grid()
    assert Grid.count_neighbors(grid, {2, 2}) == 2
  end

  test "next cell" do
    grid = new_grid()
    # 2 neighbors, cell is alive, stays alive
    assert Grid.next_cell(grid, {2, 2}) == true
    # 2 neighbors, cell is dead, stays dead
    assert Grid.next_cell(grid, {3, 3}) == false
    # 3 neighbors, cell becomes alive
    assert Grid.next_cell(grid, {1, 2}) == true
    # 1 neighbor, cell dies
    assert Grid.next_cell(grid, {2, 1}) == false
  end

  test "next_grid" do
    actual = new_grid() |> Grid.next_grid()
    expected = %{
      {1, 1} => false,
      {2, 1} => false,
      {3, 1} => false,
      {1, 2} => true,
      {2, 2} => true,
      {3, 2} => true,
      {1, 3} => false,
      {2, 3} => false,
      {3, 3} => false
    }

    assert actual == expected
  end

  defp new_grid(opts \\ :unused), do:  Grid.new(opts)
end
