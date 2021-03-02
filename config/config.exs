# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config



config :artscii_web,
  generators: [context_app: :artscii]

# Configures the endpoint
config :artscii_web, ArtsciiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "g/pvqPgFDLJlXEQuISK2hbnNzegVuUqardDWacFT9FVEWH8XnZmYg3pye7PZP8C6",
  render_errors: [view: ArtsciiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Artscii.PubSub,
  live_view: [signing_salt: "dA1k9wQw"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
