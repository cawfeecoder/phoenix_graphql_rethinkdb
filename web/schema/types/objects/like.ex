defmodule RethinkdbGraphqlRethinkdb.Types.Like do
use Absinthe.Schema.Notation
use Absinthe.Ecto, repo: RethinkdbGraphqlRethinkdb.Repo

  object :like do
    field :id, :id
    field :created_at, :string
    field :value, :integer
    field :user, :user, resolve: assoc(:user)
    field :post, :post, resolve: assoc(:post)
    field :video, :video, resolve: assoc(:video)
    field :comment, :comment, resolve: assoc(:comment)
  end
end
