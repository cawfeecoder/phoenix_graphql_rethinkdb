defmodule RethinkdbGraphqlRethinkdb.LikeResolver do
  alias RethinkdbGraphqlRethinkdb.Repo
  alias RethinkdbGraphqlRethinkdb.Like
  import Ecto.Query

  def all(_args, _info) do
    case Repo.all(Like) do
      [] -> {:error, "No Likes found. Perhaps the database is empty?"}
      result -> {:ok, result}
    end
  end

  def findByID(%{id: id}, _info) do
    case Repo.get(Like, id) do
      nil -> {:error, "Like with id #{id} not found"}
      result -> {:ok, result}
    end
  end

  def findByUserID(%{user_id: user_id}, _info) do
    case Like |> where([l], l.user_id == ^user_id) |> Repo.all do
      [] -> {:error, "No Likes belonging to User ID '#{user_id}' found"}
      result -> {:ok, result}
    end
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
    case Like |> where([l], l.video_id == ^video_id) |> Repo.all do
      [] -> {:error, "No Likes belonging to Video ID '#{video_id}' found"}
      result -> {:ok, result}
    end
  end

  def findByPostID(%{post_id: post_id}, _info) do
    case Like |> where([l], l.post_id == ^post_id) |> Repo.all do
      [] -> {:error, "No Likes belonging to Post ID '#{post_id}' found"}
      result -> {:ok, result}
    end
  end

    def findByCommentID(%{comment_id: comment_id}, _info) do
    case Like |> where([l], l.comment_id == ^comment_id) |> Repo.all do
      [] -> {:error, "No Likes belonging to Comment ID '#{comment_id}' found"}
      result -> {:ok, result}
    end
  end

end
