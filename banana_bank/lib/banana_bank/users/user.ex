defmodule BananaBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset

  @required_params [:name, :password, :email, :cep]
  @required_params_update [:name, :email, :cep]

  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string
    field :cep, :string

    timestamps()
  end


  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> do_validations(@required_params)
    |> add_hashed_password()
  end

  def changeset(user, params) do
    user
    |> cast(params, @required_params)
    |> do_validations(@required_params_update)
    |> add_hashed_password()
  end

  defp do_validations(changeset, fields) do
    changeset
    |> validate_required(fields)
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/@/)

  end

  defp add_hashed_password(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password_hash: Argon2.hash_pwd_salt(password))
  end

  defp add_hashed_password(changeset), do: changeset
end
