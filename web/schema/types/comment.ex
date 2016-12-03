defmodule RethinkdbGraphqlRethinkdb.Types.Comment do
use Absinthe.Schema.Notation
use Absinthe.Ecto, repo: RethinkdbGraphqlRethinkdb.Repo

  object :comment do
    field :id, :id
    field :created_at, :string
    field :title, :string
    field :body, :string
    field :user, :user, resolve: assoc(:user)
    field :post, :post, resolve: assoc(:post)
    field :video, :video, resolve: assoc(:video)
    field :likes, list_of(:like), resolve: assoc(:likes)
  end
end
