# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :mjml_demo,
  ecto_repos: [MjmlDemo.Repo]

# Configures the endpoint
config :mjml_demo, MjmlDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NdkSitfe5w8IYKzgNw1oyBimRvWjDb6ejop21+CdbSTE1rUdW7iNB3CW0NrWnhho",
  render_errors: [view: MjmlDemoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: MjmlDemo.PubSub,
  live_view: [signing_salt: "Pq1ZSG/9"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
