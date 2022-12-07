defmodule DayTwoPartTwo do
  @rock_paper_scissors_map %{"A" => "rock", "B" => "paper", "C" => "scissors"}
  @instructions_map %{"X" => :lost, "Y" => :draw, "Z" => :win}
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
    |> List.to_tuple()
    |> then(fn {opponent_play, instruction} -> { @rock_paper_scissors_map[opponent_play], @instructions_map[instruction] } end)
  end

  defp calculate_score({opponent_play, :draw}, acc) do
    @points_by_play[:draw] + @points_by_piece[opponent_play] + acc
  end

  defp calculate_score({"rock", :win}, acc) do
    @points_by_play[:win] + @points_by_piece["paper"] + acc
  end

  defp calculate_score({"rock", :lost}, acc) do
    @points_by_play[:lost] + @points_by_piece["scissors"] + acc
  end

  defp calculate_score({"paper", :win}, acc) do
    @points_by_play[:win] + @points_by_piece["scissors"] + acc
  end

  defp calculate_score({"paper", :lost}, acc) do
    @points_by_play[:lost] + @points_by_piece["rock"] + acc
  end

  defp calculate_score({"scissors", :win}, acc) do
    @points_by_play[:win] + @points_by_piece["rock"] + acc
  end

  defp calculate_score({"scissors", :lost}, acc) do
    @points_by_play[:lost] + @points_by_piece["paper"] + acc
  end

end