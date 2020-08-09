defmodule BplateTwo.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :token, :string, null: false

      timestamps()
    end

    create unique_index(:accounts, [:token])
  end
end
