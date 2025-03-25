defmodule BananaBank.Users do
  alias BananaBank.Users.Create
  alias BananaBank.Users.User
  alias BananaBank.Users.Get
  alias BananaBank.Users.Update

  defdelegate create_user(params), to: Create, as: :call

  defdelegate get_user(id), to: Get, as: :call

  defdelegate update_user(params), to: Update, as: :call

end
