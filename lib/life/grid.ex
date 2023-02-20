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
  def new(grid) when is_list(grid) do
    for x <- 1..3, y <- 1..3, into: %{} do
      {{x, y}, {x, y} in grid}
    end
  end

  def new(:repeater) do
    new([
      {2, 1},
      {2, 2},
      {2, 3}
    ])
  end

  def new(:stable) do
    new([
      {1, 1},
      {1, 2},
      {2, 1},
      {2, 2}
    ])
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
    count_neighbors = Life.Grid.count_neighbors(grid, point)

    cond do
      count_neighbors === 2 -> grid[point]
      count_neighbors === 3 -> true
      true -> false
    end
  end

  defp read(grid, point), do: Map.get(grid, point, false)

  # def next_grid(grid) do
  #   new_values =
  #     Map.keys(grid)
  #     |> Enum.map(fn x -> Life.Grid.next_cell(grid, x) end)

  #   Enum.zip(Map.keys(grid), new_values) |> Enum.into(%{})
  # end

  def next_grid(grid) do
    for x <- 1..3, y <- 1..3, into: %{} do
      {{x, y}, Life.Grid.next_cell(grid, {x, y})}
    end
  end

  def show(grid), do: :feature_not_implemented
  # show one cell
  # show one row
  # show one grid
end
