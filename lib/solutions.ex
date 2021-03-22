defmodule Solutions do
  @moduledoc false

  @doc """
  "turma de elixir formacao elixir de elixir"
  %{"turma" => 1, "de" => 2, "elixir" => 3, "formacao" => 1}
  """
  def get_words_occurrence(sentence) do
    sentence
    |> String.downcase()
    |> String.split()
    |> Enum.reduce(Map.new(), &get_each_word_number/2)
  end

  defp get_each_word_number(word, map) do
    IO.inspect(map)
    Map.update(map, word, 1, fn x -> 1 + x end)
  end

  @doc """
  [1, 5, 0, 8, 10, 9], 19

  [4, 5]
  """
  def get_two_sum_index(_integers_list, _target) do
    IO.puts("TODO")
  end
end
