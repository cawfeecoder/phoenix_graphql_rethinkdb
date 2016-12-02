# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :rethinkdb_graphql_rethinkdb,
  ecto_repos: [RethinkdbGraphqlRethinkdb.Repo]

# Configures the endpoint
config :rethinkdb_graphql_rethinkdb, RethinkdbGraphqlRethinkdb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pd6QUiCGxuicQUOV7xV6GgQ+VmtTwc/yw/KokqSl8Jvrvu2134N5TxMT1yToiHuN",
  render_errors: [view: RethinkdbGraphqlRethinkdb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RethinkdbGraphqlRethinkdb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
