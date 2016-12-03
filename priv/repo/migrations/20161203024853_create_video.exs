defmodule RethinkdbGraphqlRethinkdb.Repo.Migrations.CreateVideo do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :title, :string
      add :url, :string
      add :description, :string
      add :published, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:videos, [:user_id])

  end
end
