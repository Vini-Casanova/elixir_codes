defmodule BananaBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset

  @required_params [:name, :password_hash, :email, :cep]

  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string
    field :cep, :string

    timestamps()
  end

  def changeset(user \\%__MODULE__{} , params) do

    user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 3)
    |> validate_length(:password, min: 6)
    |> validate_format(:email, ~r/@/)
    |> add_hashed_password()
  end

  defp add_hashed_password(%Changeset{data: user, changes: %{password: password}} = changeset) do
    # change(changeset, password_hash: Argon2.hash_password(password))
    IO.inspect(Argon2.hash_password(password))
    IO.puts("Password: #{Argon2.hash_password(password)}")
  end

  # defp add_hashed_password(changeset), do: changeset

  defp add_hashed_password(changeset) do
    # change(changeset, password_hash: Argon2.hash_password(password))
    IO.inspect(Argon2.hash_password("2123123123"))
    IO.puts("Password: #{Argon2.hash_password("1213123123123")}")
  end
end
