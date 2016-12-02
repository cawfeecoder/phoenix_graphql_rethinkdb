defmodule RethinkdbGraphqlRethinkdb.PostResolver do
  alias RethinkdbGraphqlRethinkdb.Repo
  alias RethinkdbGraphqlRethinkdb.Post

  def all(_args, _info) do
    {:ok, Repo.all(Post)}
  end 
end
