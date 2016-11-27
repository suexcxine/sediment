# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :sediment, Sediment.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ExuI7yNd9A2Xj95rcnecoeMLuHqHdCLq16wq6sHueaqo55akfN2Ghptgw6jZIVHo",
  render_errors: [view: Sediment.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Sediment.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :mysql_poolboy,
  pool: {[size: 10, max_overflow: 20],
         [user: "root", password: "", database: "sediment_dev",
          prepare: []]}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
