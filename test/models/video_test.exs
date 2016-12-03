defmodule RethinkdbGraphqlRethinkdb.VideoTest do
  use RethinkdbGraphqlRethinkdb.ModelCase

  alias RethinkdbGraphqlRethinkdb.Video

  @valid_attrs %{description: "some content", published: true, title: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Video.changeset(%Video{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Video.changeset(%Video{}, @invalid_attrs)
    refute changeset.valid?
  end
end
