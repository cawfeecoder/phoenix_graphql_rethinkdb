defmodule RethinkdbGraphqlRethinkdb.VideoResolver do
  alias RethinkdbGraphqlRethinkdb.Repo
  alias RethinkdbGraphqlRethinkdb.Video

  def all(_args, _info) do
    {:ok, Repo.all(Video)}
  end
end
