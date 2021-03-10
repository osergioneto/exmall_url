# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :exmall_url,
  ecto_repos: [ExmallUrl.Repo]

# Configures the endpoint
config :exmall_url, ExmallUrlWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "81p2te0P+GQ3sWAhskmFIRkJ3rtCPg7QZ53nTBvLePBqN8zjDAAdx1b1LBDNZZE7",
  render_errors: [view: ExmallUrlWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ExmallUrl.PubSub,
  live_view: [signing_salt: "tFzo5lpX"]

config :exmall_url, ExmallUrl.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
