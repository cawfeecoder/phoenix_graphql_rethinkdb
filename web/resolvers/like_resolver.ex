defmodule RethinkdbGraphqlRethinkdb.LikeResolver do
  alias RethinkdbGraphqlRethinkdb.Repo
  alias RethinkdbGraphqlRethinkdb.Like
  import Ecto.Query

  def all(_args, _info) do
    {:ok, Repo.all(Like)}
  end

  def findByID(%{id: id}, _info) do
    case Repo.get(Like, id) do
      nil -> {:error, "Like with id #{id} not found"}
      like -> {:ok, like}
    end
  end

  def findByUserID(%{user_id: user_id}, _info) do
      {:ok, Like |> where([l], l.user_id == ^user_id) |> Repo.all}
  end

  def findByEmail(%{email: email}, _info) do
      case RethinkdbGraphqlRethinkdb.UserResolver.findByEmail(%{email: email}, "Resolving for comment lookup") do
        {:error, msg} -> {:error, msg}
        {:ok, user} -> {:ok, Like |> where([l], l.user_id == ^user.id) |> Repo.all}
      end
  end

  def findByUsername(%{username: username}, _info) do
      case RethinkdbGraphqlRethinkdb.UserResolver.findByUsername(%{username: username}, "Resolving for comment lookup") do
        {:error, msg} -> {:error, msg}
        {:ok, user} -> {:ok, Like |> where([l], l.user_id == ^user.id) |> Repo.all}
      end
  end

  def findByVideoID(%{video_id: video_id}, _info) do
    {:ok, Like |> where([l], l.video_id == ^video_id) |> Repo.all}
  end

  def findByPostID(%{post_id: post_id}, _info) do
    {:ok, Like |> where([l], l.post_id == ^post_id) |> Repo.all}
  end

  def findByCommentID(%{comment_id: comment_id}, _info) do
    {:ok, Like |> where([l], l.comment_id == ^comment_id) |> Repo.all}
  end

end
