defmodule RethinkdbGraphqlRethinkdb.Comment do
  use RethinkdbGraphqlRethinkdb.Web, :model

  schema "comments" do
    field :created_at, :string
    field :title, :string
    field :body, :string
    belongs_to :video, RethinkdbGraphqlRethinkdb.Video
    belongs_to :post, RethinkdbGraphqlRethinkdb.Post
    belongs_to :user, RethinkdbGraphqlRethinkdb.User
    has_many :likes, RethinkdbGraphqlRethinkdb.Like

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:created_at, :title, :body])
    |> validate_required([:created_at, :title, :body])
  end
end
