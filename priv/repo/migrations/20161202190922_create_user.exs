defmodule RethinkdbGraphqlRethinkdb.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:usera) do
      add :name, :string
      add :email, :string

      timestamps()
    end

  end
end
