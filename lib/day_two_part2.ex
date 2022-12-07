defmodule DayTwoPartTwo do
  @rock_paper_scissors_map %{"A" => "rock", "B" => "paper", "C" => "scissors"}
  @instructions_map %{"X" => :lost, "Y" => :draw, "Z" => :win}
  @points_by_piece %{"rock" => 1, "paper" => 2, "scissors" => 3}
  @points_by_play %{lost: 0, draw: 3, win: 6}

  @doc """
  --- Part Two ---
  The Elf finishes helping with the tent and sneaks back over to you. "Anyway, the second column says how the round needs to end: X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win. Good luck!"

  The total score is still calculated in the same way, but now you need to figure out what shape to choose so the round ends as indicated. The example above now goes like this:

  In the first round, your opponent will choose Rock (A), and you need the round to end in a draw (Y), so you also choose Rock. This gives you a score of 1 + 3 = 4.
  In the second round, your opponent will choose Paper (B), and you choose Rock so you lose (X) with a score of 1 + 0 = 1.
  In the third round, you will defeat your opponent's Scissors with Rock for a score of 1 + 6 = 7.
  Now that you're correctly decrypting the ultra top secret strategy guide, you would get a total score of 12.

  Following the Elf's instructions for the second column, what would your total score be if everything goes exactly according to your strategy guide?
  """
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