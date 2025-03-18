defmodule BananaBankWeb.UserController do
  use BananaBankWeb, :controller

  alias BananaBank.Users
  alias Users.User

  action_fallback BananaBankWeb.FallbackContoller

  def create(conn, params) do
    with {:ok ,  %User{} = user} <- Users.create_user(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end


end
