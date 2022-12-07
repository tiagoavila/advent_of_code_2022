defmodule DayTwo do
  @rock_paper_scissors_map %{"A" => "rock", "B" => "paper", "C" => "scissors", "X" => "rock", "Y" => "paper", "Z" => "scissors"}
  @points_by_piece %{"rock" => 1, "paper" => 2, "scissors" => 3}
  @points_by_play %{lost: 0, draw: 3, win: 6}

  def get_total_score(strategy_guide) do
    strategy_guide
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_play_to_tuple/1)
    |> Enum.reduce(0, &calculate_score/2)
  end

  defp parse_play_to_tuple(play) do
    play
    |> String.split(" ", trim: true)
    |> Enum.map(&(@rock_paper_scissors_map[&1]))
    |> List.to_tuple()
  end

  defp calculate_score({opponent_play, my_play}, acc) when opponent_play == my_play do
    @points_by_play[:draw] + @points_by_piece[my_play] + acc
  end

  defp calculate_score({"rock", my_play = "paper"}, acc) do
    @points_by_play[:win] + @points_by_piece[my_play] + acc
  end

  defp calculate_score({"scissors", my_play = "paper"}, acc) do
    @points_by_play[:lost] + @points_by_piece[my_play] + acc
  end

  defp calculate_score({"paper", my_play = "rock"}, acc) do
    @points_by_play[:lost] + @points_by_piece[my_play] + acc
  end

  defp calculate_score({"scissors", my_play = "rock"}, acc) do
    @points_by_play[:win] + @points_by_piece[my_play] + acc
  end

  defp calculate_score({"rock", my_play = "scissors"}, acc) do
    @points_by_play[:lost] + @points_by_piece[my_play] + acc
  end

  defp calculate_score({"paper", my_play = "scissors"}, acc) do
    @points_by_play[:win] + @points_by_piece[my_play] + acc
  end
end