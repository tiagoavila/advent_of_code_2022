defmodule DayThree do
  def get_sum_priorities(contents) do
    contents
    |> String.split("\n", trim: true)
    |> Enum.map(&get_repeated_item/1)
    |> Enum.map(&get_priority/1)
    |> Enum.sum()
  end

  defp get_repeated_item(content) do
    {left, right} = content
    |> String.split_at(div(String.length(content), 2))

    left
    |> String.graphemes()
    |> Enum.find(&(String.contains?(right, &1)))
  end

  def get_priority(<<codepoint::utf8>>) when codepoint in ?a..?z do
    codepoint - 96
  end

  def get_priority(<<codepoint::utf8>>) when codepoint in ?A..?Z do
    codepoint - 38
  end
end
