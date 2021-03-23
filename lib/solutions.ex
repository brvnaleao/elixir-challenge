defmodule Solutions do
  @moduledoc false

  @doc """
  "turma de elixir formacao elixir de elixir"
  %{"turma" => 1, "de" => 2, "elixir" => 3, "formacao" => 1}
  """
  def get_words_occurrence(sentence) do
    sentence
    |> String.split()
    |> Enum.reduce(Map.new(), fn(word, map) ->
      Map.update(map, word, 1, fn x -> 1 + x end)
    end)
  end

  @doc """
  [1, 5, 0, 8, 10, 9], 19

  [4, 5]
  """
  def get_two_sum_index(integers_list, target) do

    result =
      Enum.zip(0..length(integers_list), integers_list)
      |> Enum.reduce_while([], fn {x, y}, acc ->

        aux = target - x
        case Enum.find_index(integers_list,fn x -> x == aux end) do
          nil -> {:cont, acc}
          aux -> {:halt, [y, aux]}
          _ -> {:cont, acc}
        end

      end)
      |> Enum.map(fn x -> x - 1 end)

    result
  end

  
end
