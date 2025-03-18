defmodule BananaBank.Users do
  alias BananaBank.Users.Create
  alias BananaBank.Users.User

  defdelegate create_user(params), to: Create, as: :call


end
