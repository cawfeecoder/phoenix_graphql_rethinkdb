defmodule RethinkdbGraphqlRethinkdb.Types.User do
use Absinthe.Schema.Notation
use Absinthe.Ecto, repo: RethinkdbGraphqlRethinkdb.Repo

  object :user do
    field :id, :id
    field :first_name, :string
    field :last_name, :string
    field :username, :string
    field :join_date, :string
    field :email, :string
    field :role, :string
    field :suspended, :boolean
    field :suspend_time, :integer
    field :posts, list_of(:post), resolve: assoc(:posts)
    field :comments, list_of(:comment), resolve: assoc(:comments)
    field :videos, list_of(:video), resolve: assoc(:videos)
    field :likes, list_of(:like), resolve: assoc(:likes)
  end
end
