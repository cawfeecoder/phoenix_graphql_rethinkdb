defmodule RethinkdbGraphqlRethinkdb.Video do
  use RethinkdbGraphqlRethinkdb.Web, :model

  schema "videos" do
    field :title, :string
    field :url, :string
    field :description, :string
    field :created_at, :string
    field :view_count, :integer
    field :published, :boolean, default: false
    belongs_to :user, RethinkdbGraphqlRethinkdb.User
    has_many :comments, RethinkdbGraphqlRethinkdb.Comment
    has_many :likes, RethinkdbGraphqlRethinkdb.Like

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :url, :description, :published])
    |> validate_required([:title, :url, :description, :published])
  end
end
