defmodule RethinkdbGraphqlRethinkdb.Types.Post do
use Absinthe.Schema.Notation
use Absinthe.Ecto, repo: RethinkdbGraphqlRethinkdb.Repo

  object :post do
    field :id, :id
    field :title, :string
    field :published, :boolean
    field :created_at, :string
    field :body, :string
    field :user, :user, resolve: assoc(:user)
    field :likes, list_of(:like), resolve: assoc(:likes)
    field :comments, list_of(:comment), resolve: assoc(:comments)
  end
end
