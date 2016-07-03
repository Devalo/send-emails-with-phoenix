# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :emailapp,
  ecto_repos: [Emailapp.Repo]

# Configures the endpoint
config :emailapp, Emailapp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/9d6AZUOstcJ4l4HqFQ1oHxhTRWixYdQmkYqN1g+bSbUk8FmElmr39rUW5SF0PBd",
  render_errors: [view: Emailapp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Emailapp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]




# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
import_config "config.secret.exs"
