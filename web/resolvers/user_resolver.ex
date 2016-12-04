defmodule RethinkdbGraphqlRethinkdb.UserResolver do
  alias RethinkdbGraphqlRethinkdb.Repo
  alias RethinkdbGraphqlRethinkdb.User
  import Ecto.Query
  import Ecto.Changeset, only: [put_change: 3, get_change: 2]

  # Query Resolvers

  def all(_args, _info) do
    case Repo.all(User) do
      [] -> {:error, "No Users found. Perhaps the database is empty?"}
      result -> {:ok, result}
    end
  end

  def findByID(%{id: id}, _info) do
    case Repo.get(User, id) do
      nil -> {:error, "User with id #{id} not found"}
      result -> {:ok, result}
    end
  end

  def findByEmail(%{email: email}, _info) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, "User with email #{email} not found"}
      result -> {:ok, result}
    end
  end

  def findByRole(%{role: role}, _info) do
    role = role |> String.downcase
    case User |> where([u], u.role == ^role) |> Repo.all do
      [] -> {:error, "No Users with role '#{role}' found"}
      result -> {:ok, result}
    end
  end

  def findByUsername(%{username: username}, _info) do
    case Repo.get_by(User, username: username) do
      nil -> {:error, "User with username #{username} not found"}
      result -> {:ok, result}
    end
  end

  # Mutations Resolvers

  def create(args, _info) do
    user = %User{} |> User.changeset(args)
    hashed_password = user |> get_change(:password) |> hashed_password
    case user |> put_change(:password, hashed_password) |> put_change(:suspended, false) |> put_change(:role, "user") |> put_change(:join_date, DateTime.utc_now |> DateTime.to_string) |> Repo.insert do
      {:error, a} -> {:error, a}
      {:ok, b} -> {:ok, b}
    end
  end

  def update_single(args, _info) do
    user = Repo.get(User, args.id)
    args = if Map.has_key?(args, :password) do
      Map.put(args, :password, hashed_password(args.password))
    end
    user_update = User.changeset(user, args)
    case user do
      nil -> {:error, "User with id #{args.id} not found"}
      _ -> Repo.update(user_update)
    end
  end

  def suspend_single(args, _info) do
    user = Repo.get(User, args.id)
    case user do
      nil -> {:error, "Could not find User with id #{args.id}"}
      user ->
        case user.suspended do
          false -> User.changeset(user, Map.put_new(args, :suspended, true)) |> Repo.update
          true -> User.changeset(user, args) |> Repo.update
        end
    end
  end

  def unsuspend_single(args, _info) do
    user = Repo.get(User, args.id)
    case user do
      nil -> {:error, "Could not find User with id #{args.id}"}
      user ->
        case user.suspended do
          true -> User.changeset(user, Map.put_new(args, :suspended, false)) |> put_change(:suspend_time, 0) |> Repo.update
          false -> {:error, "User #{user.username} is not suspended."}
        end
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
