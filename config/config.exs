# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :thathapay,
  ecto_repos: [Thathapay.Repo]

# Configures the endpoint
config :thathapay, ThathapayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3RnB+STCZ2Gz8Lp9Uzz51Ta8ULjz98KZCghrAbFWHf4LK97HkJWHbVCBJUug3Ayz",
  render_errors: [view: ThathapayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Thathapay.PubSub,
  live_view: [signing_salt: "ud9GjIOo"]

  #Toda tabela que for criada pelo Ecto irá utilizar, automaticamente, binary_id
  config :thathapay, Thathapay.Repo,
    migration_primary_key: [type: :binary_id],
    migration_foreing_key: [type: :binary_id]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
