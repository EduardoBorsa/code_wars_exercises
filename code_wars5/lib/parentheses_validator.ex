defmodule ParenthesesValidator do
  # def valid_parentheses(""), do: true
  #
  # def valid_parentheses(string) when is_binary(string) do
  #   String.replace(string, ~r/(?!\(|\))./, "")
  #   |> valid_parentheses(String.length(string))
  # end
  #
  # def valid_parentheses("", _length), do: true
  #
  # def valid_parentheses(string, length) do
  #   new_str =
  #     string
  #     |> String.replace(~r/\(\)/, "")
  #
  #   cond do
  #     String.length(new_str) == length ->
  #       false
  #
  #     true ->
  #       valid_parentheses(new_str, String.length(new_str))
  #   end
  # end

  def valid_parentheses(string) do
    string
    |> String.graphemes()
    |> Enum.reduce_while(0, fn
      "(", n -> {:cont, n + 1}
      ")", 0 -> {:halt, -1}
      ")", n -> {:cont, n - 1}
      _, n -> {:cont, n}
    end) == 0
  end

  def test do
    1..100
    |> Enum.reduce_while(0, fn
      5, acc -> {:halt, acc}
      n, acc -> {:cont, acc + n}
    end)
  end

  def valid_parentheses(""), do: true

  # def valid_parentheses(string) do
  #   new_string =
  #     string
  #     |> String.replace(~r/[^()]+/, "")
  #     |> String.replace("()", "")

  #   if new_string == string, do: false, else: valid_parentheses(new_string)
  # end

  def valid_parentheses(string) do
    string
    |> Regex.compile()
    |> do_valid_parentheses()
  end

  defp do_valid_parentheses({:ok, _}), do: true
  defp do_valid_parentheses(_), do: false
end
