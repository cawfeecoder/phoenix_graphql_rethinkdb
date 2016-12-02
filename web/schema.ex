defmodule RethinkdbGraphqlRethinkdb.Schema do
  use Absinthe.Schema
  import_types RethinkdbGraphqlRethinkdb.Schema.Types

  query do
    field :posts, list_of(:post) do
      resolve &RethinkdbGraphqlRethinkdb.PostResolver.all/2
    end

    field :users, list_of(:user) do
      resolve &RethinkdbGraphqlRethinkdb.UserResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &RethinkdbGraphqlRethinkdb.UserResolver.find/2
    end
  end
end
