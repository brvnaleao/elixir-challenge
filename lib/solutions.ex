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
    arr =
      Enum.map integers_list, fn x ->
        List.delete(integers_list, x)
        |> sum_numbers(x, target)
        |> List.flatten

      end
    arr_filtered =
      Enum.filter(arr, fn x -> is_list(x) and length(x) > 1 end)
      |> Enum.map(fn x -> Enum.sort(x) end)
      |> Enum.uniq

    Enum.each(arr_filtered, fn x ->
      get_index( x, integers_list)
      |> IO.inspect
    end)
  end

  defp get_index(items, list) do

    first_item = Enum.at(items, -1)
    second_item = Enum.at(items, -2)
    arr =
      Enum.zip(0..length(list), list)
      |> Enum.filter(fn x ->
        list = Tuple.to_list(x)
        get_el_list(list, -1) == first_item || get_el_list(list, -1) == second_item
    end)

    Enum.map(arr, fn x ->
      Tuple.to_list(x)
      |> get_el_list(-2)
    end)
  end

  defp get_el_list(list, position) do
    Enum.at(list, position)
  end

  defp sum_numbers(list, num, expected) do
    it = Enum.filter(list, fn x -> x + num == expected end)
    [num, it]
  end
end
