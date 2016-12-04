defmodule RethinkdbGraphqlRethinkdb.VideoResolver do
  alias RethinkdbGraphqlRethinkdb.Repo
  alias RethinkdbGraphqlRethinkdb.Video
  import Ecto.Query

  def all(_args, _info) do
    {:ok, Repo.all(Video)}
  end

  def findByID(%{id: id}, _info) do
    case Repo.get(Video, id) do
      nil -> {:error, "Video with id #{id} not found"}
      video -> {:ok, video}
    end
  end

  def findByUserID(%{user_id: user_id}, _info) do
      {:ok, Video |> where([v], v.user_id == ^user_id) |> Repo.all}
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
