defmodule RethinkdbGraphqlRethinkdb.Repo.Migrations.CreateLike do
  use Ecto.Migration

  def change do
    create table(:likes) do
      add :created_at, :string
      add :value, :integer
      add :video_id, references(:videos, on_delete: :nothing)
      add :post_id, references(:posts, on_delete: :nothing)
      add :comment_id, references(:comments, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:likes, [:video_id])
    create index(:likes, [:post_id])
    create index(:likes, [:comment_id])
    create index(:likes, [:user_id])

  end
end
