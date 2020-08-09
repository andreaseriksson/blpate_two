defmodule BplateTwo.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :token, :string

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [])
    |> validate_required([])
  end

  @doc false
  def registration_changeset(account, attrs) do
    account
    |> cast(attrs, [])
    |> validate_required([])
    |> set_token(account)
  end

  defp set_token(changeset, %{token: "" <> _}), do: changeset
  defp set_token(changeset, _struct) do
    token = create_token()
    put_change(changeset, :token, token)
  end

  defp create_token(length \\ 20) do
    :crypto.strong_rand_bytes(length) |> Base.url_encode64 |> binary_part(0, length)
  end
end
