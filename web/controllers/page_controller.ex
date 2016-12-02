defmodule RethinkdbGraphqlRethinkdb.PageController do
  use RethinkdbGraphqlRethinkdb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
