defmodule RethinkdbGraphqlRethinkdb.Like do
  use RethinkdbGraphqlRethinkdb.Web, :model

  schema "likes" do
    field :created_at, :string
    field :value, :integer
    belongs_to :video, RethinkdbGraphqlRethinkdb.Video
    belongs_to :post, RethinkdbGraphqlRethinkdb.Post
    belongs_to :comment, RethinkdbGraphqlRethinkdb.Comment
    belongs_to :user, RethinkdbGraphqlRethinkdb.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:created_at])
    |> validate_required([:created_at])
  end
end
