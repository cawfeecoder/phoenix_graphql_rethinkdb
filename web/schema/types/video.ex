defmodule RethinkdbGraphqlRethinkdb.Types.Video do
use Absinthe.Schema.Notation
use Absinthe.Ecto, repo: RethinkdbGraphqlRethinkdb.Repo

  object :video do
    field :id, :id
    field :title, :string
    field :url, :string
    field :published, :boolean
    field :created_at, :string
    field :description, :string
    field :user, :user, resolve: assoc(:user)
    field :likes, list_of(:like), resolve: assoc(:likes)
    field :comments, list_of(:comment), resolve: assoc(:comments)
  end
end
