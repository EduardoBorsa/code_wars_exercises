defmodule MultiplesOf35 do
  def solution(number) do
    MapSet.union(
      gen_lower_than(number, 3),
      gen_lower_than(number, 5)
    )
    |> Enum.sum()
  end

  def gen_lower_than(number, pa_value) do
    gen_lower_than(number, pa_value, pa_value, MapSet.new())
  end

  def gen_lower_than(number, pa_value, current, mapset) do
    cond do
      current < number ->
        gen_lower_than(number, pa_value, current + pa_value, MapSet.put(mapset, current))

      true ->
        mapset
    end
  end
end
