defmodule Directions do
  def reduce(directions) do
    new_reduce = reduce(directions, [])

    cond do
      new_reduce == directions ->
        directions

      true ->
        reduce(new_reduce)
    end
  end

  def reduce(["NORTH", "SOUTH" | t], acc) do
    reduce(t, acc)
  end

  def reduce(["SOUTH", "NORTH" | t], acc) do
    reduce(t, acc)
  end

  def reduce(["WEST", "EAST" | t], acc) do
    reduce(t, acc)
  end

  def reduce(["EAST", "WEST" | t], acc) do
    reduce(t, acc)
  end

  def reduce([], acc) do
    acc
  end

  def reduce([h | t], acc) do
    reduce(t, [h | acc])
  end
end
