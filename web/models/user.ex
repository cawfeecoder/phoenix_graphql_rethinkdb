defmodule RethinkdbGraphqlRethinkdb.User do
  use RethinkdbGraphqlRethinkdb.Web, :model

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :username, :string
    field :join_date, :string
    field :email, :string
    field :password, :string
    field :role, :string
    field :suspended, :boolean
    field :suspend_time, :integer
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
    |> cast(params, [:first_name, :last_name, :username, :email, :password, :role, :suspended, :suspend_time])
    |> validate_required([:first_name, :last_name, :username, :email, :password, :role, :suspended])
  end
end
