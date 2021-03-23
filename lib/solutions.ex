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

    new_list = integers_list
      |> Enum.uniq

    new_list
      |> Enum.map(fn x ->
          List.delete(new_list, x)
          |> filter_numbers(x, target)
          |> List.flatten
          end)
      |> Enum.filter(fn x -> is_list(x) and length(x) > 1 end)
      |> Enum.map(fn x -> Enum.sort(x) end)
      |> Enum.uniq
      |> Enum.each(fn x ->
          get_index( x, new_list)
          |> IO.inspect
      end)
  end

  defp get_index(items, integers_list) do

    first_item = Enum.at(items, -1)
    second_item = Enum.at(items, -2)

    list_with_indexes =
      create_indexes(integers_list)
      |> Enum.filter(fn x ->
          list = Tuple.to_list(x)
          get_list_element(list, -1) == first_item || get_list_element(list, -1) == second_item
        end)
      |> Enum.map(fn x ->
        Tuple.to_list(x)
        |> get_list_element(-2)
      end)
      list_with_indexes
  end

  defp create_indexes (list) do
    Enum.zip(0..length(list), list)
  end

  defp get_list_element(list, position) do
    Enum.at(list, position)
  end

  defp filter_numbers(list, num, expected) do
    item = Enum.filter(list, fn x ->
      x + num == expected
    end)
    [num, item]
  end
end
