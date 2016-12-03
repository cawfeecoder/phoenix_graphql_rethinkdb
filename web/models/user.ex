defmodule RethinkdbGraphqlRethinkdb.User do
  use RethinkdbGraphqlRethinkdb.Web, :model

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :username, :string
    field :email, :string
    field :password, :string
    field :role, :string
    has_many :posts, RethinkdbGraphqlRethinkdb.Post
    has_many :comments, RethinkdbGraphqlRethinkdb.Comment
    has_many :likes, RethinkdbGraphqlRethinkdb.Like
    has_many :videos, RethinkdbGraphqlRethinkdb.Video

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :username, :email, :password])
    |> validate_required([:first_name, :last_name, :username, :email, :password])
  end
end
