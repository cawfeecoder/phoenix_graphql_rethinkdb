defmodule RethinkdbGraphqlRethinkdb.LikeResolver do
  alias RethinkdbGraphqlRethinkdb.Repo
  alias RethinkdbGraphqlRethinkdb.Like

  def all(_args, _info) do
    {:ok, Repo.all(Like)}
  end
end
