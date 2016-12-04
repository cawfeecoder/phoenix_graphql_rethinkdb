defmodule RethinkdbGraphqlRethinkdb.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :username, :string
      add :join_date, :string
      add :email, :string
      add :password, :string
      add :role, :string, default: "user"
      add :suspended, :boolean
      add :suspend_time, :integer

      timestamps()
    end

  end
end
