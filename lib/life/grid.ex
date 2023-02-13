defmodule Life.Grid do
  @height 3
  @width 3
  def new(_ignore) do
    # .*.
    # .*.
    # .*.
    %{
      {1, 1} => false, {2, 1} => true, {3, 1} => false,
      {1, 2} => false, {2, 2} => true, {3, 2} => false,
      {1, 3} => false, {2, 3} => true, {3, 3} => false,
    }
  end


  def neighbors(grid, {x, y}) do
    # paulo writes wicked cool code here...
  end

  def count_neighbors(grid, {x, y}) do
    # paulo writes excellent code here...
  end

  def read(grid, point), do: Map.get(grid, point, false)


  def next_grid(grid), do: :feature_not_implemented

  def show(grid), do: :feature_not_implemented

end
