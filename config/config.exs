use Mix.Config

config :artscii, store: Artscii.DetsStore

config :artscii_web, generators: [context_app: :artscii]

config :artscii_web, ArtsciiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "g/pvqPgFDLJlXEQuISK2hbnNzegVuUqardDWacFT9FVEWH8XnZmYg3pye7PZP8C6",
  render_errors: [view: ArtsciiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Artscii.PubSub,
  live_view: [signing_salt: "dA1k9wQw"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
