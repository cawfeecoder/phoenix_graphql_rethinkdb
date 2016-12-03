defmodule RethinkdbGraphqlRethinkdb.CommentResolver do
  alias RethinkdbGraphqlRethinkdb.Repo
  alias RethinkdbGraphqlRethinkdb.Comment

  def all(_args, _info) do
    {:ok, Repo.all(Comment)}
  end
end
