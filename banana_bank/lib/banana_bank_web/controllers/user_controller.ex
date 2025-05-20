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

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Users.get_user(id)  do
      conn
      |> put_status(:ok)
      |> render(:get, user: user)
    end

  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Users.update_user(params)  do
      conn
      |> put_status(:ok)
      |> render(:update, user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Users.delete_user(id) do
      conn
      |> put_status(:ok)
      |> render(:delete, user: user.id)
    end
  end

end
