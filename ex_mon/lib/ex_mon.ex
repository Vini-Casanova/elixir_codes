defmodule ExMon do
  @computer "robo"

 def create_player(name, normal, special) do
  ExMon.Player.build(name, normal, special)
 end

 def start_game(player) do
  @computer
  |> create_player(:punch, :ultra_kick)
  |> ExMon.Game.start(player)

  ExMon.Game.Status.print_round_message()
 end
end
