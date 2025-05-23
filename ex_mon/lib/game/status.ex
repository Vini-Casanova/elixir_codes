defmodule ExMon.Game.Status do
  alias ExMon.Game

  def print_round_message() do
    IO.puts("The game has began")
    IO.inspect(Game.info)
  end

end
