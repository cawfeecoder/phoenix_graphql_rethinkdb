defmodule RethinkdbGraphqlRethinkdb.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :created_at, :string
      add :title, :string
      add :body, :text
      add :video_id, references(:videos, on_delete: :nothing)
      add :post_id, references(:posts, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:comments, [:video_id])
    create index(:comments, [:post_id])
    create index(:comments, [:user_id])

  end
end
