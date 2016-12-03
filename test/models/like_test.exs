defmodule RethinkdbGraphqlRethinkdb.LikeTest do
  use RethinkdbGraphqlRethinkdb.ModelCase

  alias RethinkdbGraphqlRethinkdb.Like

  @valid_attrs %{created_at: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Like.changeset(%Like{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Like.changeset(%Like{}, @invalid_attrs)
    refute changeset.valid?
  end
end
