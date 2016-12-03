defmodule RethinkdbGraphqlRethinkdb.UserResolver do
  alias RethinkdbGraphqlRethinkdb.Repo
  alias RethinkdbGraphqlRethinkdb.User
  import Ecto.Query
  import Ecto.Changeset, only: [put_change: 3, get_change: 2]

  def all(_args, _info) do
    {:ok, Repo.all(User)}
  end

  def findByID(%{id: id}, _info) do
    case Repo.get(User, id) do
      nil -> {:error, "User with id #{id} not found"}
      user -> {:ok, user}
    end
  end

  def findByEmail(%{email: email}, _info) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, "User with email #{email} not found"}
      user -> {:ok, user}
    end
  end

  def findByRole(%{role: role}, _info) do
      {:ok, User |> where([u], u.role == ^role) |> Repo.all}
  end

  def findByUsername(%{username: username}, _info) do
    case Repo.get_by(User, username: username) do
      nil -> {:error, "User with username #{username} not found"}
      user -> {:ok, user}
    end
  end

  def create(args, _info) do
    user = %User{} |> User.changeset(args)
    hashed_password = user |> get_change(:password) |> hashed_password
    case user |> put_change(:password, hashed_password) |> Repo.insert do
      {:error, a} -> {:error, a}
      {:ok, b} -> {:ok, b}
    end
  end

  def delete(%{id: id}, _info) do
    user = Repo.get(User, id)
    case Repo.delete(user) do
      {:ok, struct} -> {:ok, struct}
      {:error, changeset} -> {:error, changeset}
    end
  end

  defp hashed_password(password) do
     Comeonin.Bcrypt.hashpwsalt(password)
  end
end
