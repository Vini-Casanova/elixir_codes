defmodule ExMon.Player do
  @required_keys [:life, :name, :move_normal, :move_special]
  @enforce_keys @required_keys
  defstruct @required_keys
  #defstruct ([:life, :name, :move_normal, :move_special])


  def build(name, normal, special) do
    %ExMon.Player{
      name: name,
      move_normal: normal,
      move_special: special,
      life: 100
    }
  end
end
