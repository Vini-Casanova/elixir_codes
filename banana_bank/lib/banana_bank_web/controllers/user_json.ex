defmodule BananaBankWeb.UserJSON do
  alias BananaBank.Users.User

  def create(%{user: user}) do
    %{
      message: "User criado com sucesso",
      data: data(user)
    }
  end

  def get(%{user: user}), do: %{data: data(user)}

  def update(%{user: user}), do: %{data: data(user)}

  def delete(%{user_id: id}) do
    %{
      message: "Usuário com id: #{id} deletado",
    }
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      cep: user.cep,
      email: user.email,
      name: user.name
    }
  end
end
