# Alive Cells:
# Each cell with one or no neighbors dies, as if by solitude.
# Each cell with four or more neighbors dies, as if by overpopulation.
# Each cell with two stay's as it's.
# Each cell with three neighbors survives.
# Unborn Cells:
# Each cell with three neighbors becomes populated.

# {1, 1}  {2, 1}  {3, 1}
# {1, 2}  {2, 2}  {3, 2}
# {1, 3}  {2, 3}  {3, 3}

# {x - 1, y - 1}  {x, y - 1}  {x + 1, y - 1}
#   {x - 1, y}      {x, y}      {x + 1, y}
# {x - 1, y + 1}  {x, y + 1}  {x + 1, y + 1}

defmodule Life.Grid do
  @height 3
  @width 3
  def new(_ignore) do
    %{
      {1, 1} => false,
      {2, 1} => true,
      {3, 1} => false,
      {1, 2} => false,
      {2, 2} => true,
      {3, 2} => false,
      {1, 3} => false,
      {2, 3} => true,
      {3, 3} => false
    }
  end

  def has_neighbors(grid, {x, y}) do
    [
      grid[{x, y - 1}],
      grid[{x - 1, y - 1}],
      grid[{x + 1, y - 1}],
      grid[{x - 1, y}],
      grid[{x + 1, y}],
      grid[{x - 1, y + 1}],
      grid[{x, y + 1}],
      grid[{x + 1, y + 1}]
    ]
  end

  def count_neighbors(grid, {x, y}) do
    Life.Grid.has_neighbors(grid, {x, y})
    |> Enum.filter(fn x -> x end)
    |> Enum.count()
  end

  def next_cell(grid, point) do
    cond do
      Life.Grid.count_neighbors(grid, point) === 2 -> grid[point]
      Life.Grid.count_neighbors(grid, point) === 3 -> true
      Life.Grid.count_neighbors(grid, point) === 1 -> false
    end
  end

  defp read(grid, point), do: Map.get(grid, point, false)

  def next_grid(grid) do
    new_keys =
      Map.keys(grid)
      |> Enum.map(fn x -> Life.Grid.next_cell(grid, x) end)

    Enum.zip(Map.keys(grid), new_keys) |> Enum.into(%{})
  end

  def show(grid), do: :feature_not_implemented
end
