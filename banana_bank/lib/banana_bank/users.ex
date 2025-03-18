defmodule BananaBank.Users do
  alias BananaBank.Users.Create
  alias BananaBank.Users.User
  alias BananaBank.Users.Get

  defdelegate create_user(params), to: Create, as: :call

  defdelegate get_user(id), to: Get, as: :call

end
