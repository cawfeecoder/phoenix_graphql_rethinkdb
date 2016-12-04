defmodule RethinkdbGraphqlRethinkdb.VideoResolver do
  alias RethinkdbGraphqlRethinkdb.Repo
  alias RethinkdbGraphqlRethinkdb.Video
  import Ecto.Query

  def all(_args, _info) do
    case Repo.all(Video) do
      [] -> {:error, "No Videos found. Perhaps the database is empty?"}
      result -> {:ok, result}
    end
  end

  def findByID(%{id: id}, _info) do
    case Repo.get(Video, id) do
      nil -> {:error, "Video with id #{id} not found"}
      result -> {:ok, result}
    end
  end

  def findByUserID(%{user_id: user_id}, _info) do
    case Video |> where([v], v.user_id == ^user_id) |> Repo.all do
      [] -> {:error, "No Videos belonging to User ID '#{user_id}' found"}
      result -> {:ok, result}
    end
  end

  def findByEmail(%{email: email}, _info) do
      case RethinkdbGraphqlRethinkdb.UserResolver.findByEmail(%{email: email}, "Resolving for video lookup") do
        {:error, msg} -> {:error, msg}
        {:ok, user} -> {:ok, Video |> where([v], v.user_id == ^user.id) |> Repo.all}
      end
  end

  def findByUsername(%{username: username}, _info) do
      case RethinkdbGraphqlRethinkdb.UserResolver.findByUsername(%{username: username}, "Resolving for video lookup") do
        {:error, msg} -> {:error, msg}
        {:ok, user} -> {:ok, Video |> where([v], v.user_id == ^user.id) |> Repo.all}
      end
  end
end
