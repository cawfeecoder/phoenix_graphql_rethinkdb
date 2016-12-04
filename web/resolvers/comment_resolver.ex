defmodule RethinkdbGraphqlRethinkdb.CommentResolver do
  alias RethinkdbGraphqlRethinkdb.Repo
  alias RethinkdbGraphqlRethinkdb.Comment
  import Ecto.Query

  def all(_args, _info) do
    {:ok, Repo.all(Comment)}
  end

  def findByID(%{id: id}, _info) do
    case Repo.get(Comment, id) do
      nil -> {:error, "Comment with id #{id} not found"}
      comment -> {:ok, comment}
    end
  end

  def findByUserID(%{user_id: user_id}, _info) do
      {:ok, Comment |> where([c], c.user_id == ^user_id) |> Repo.all}
  end

  def findByEmail(%{email: email}, _info) do
      case RethinkdbGraphqlRethinkdb.UserResolver.findByEmail(%{email: email}, "Resolving for comment lookup") do
        {:error, msg} -> {:error, msg}
        {:ok, user} -> {:ok, Comment |> where([c], c.user_id == ^user.id) |> Repo.all}
      end
  end

  def findByUsername(%{username: username}, _info) do
      case RethinkdbGraphqlRethinkdb.UserResolver.findByUsername(%{username: username}, "Resolving for comment lookup") do
        {:error, msg} -> {:error, msg}
        {:ok, user} -> {:ok, Comment |> where([c], c.user_id == ^user.id) |> Repo.all}
      end
  end

  def findByVideoID(%{video_id: video_id}, _info) do
    {:ok, Comment |> where([c], c.video_id == ^video_id) |> Repo.all}
  end

  def findByPostID(%{post_id: post_id}, _info) do
    {:ok, Comment |> where([c], c.post_id == ^post_id) |> Repo.all}
  end

end
