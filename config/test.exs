use Mix.Config

# let's use in memory ets for tests
config :artscii, store: Artscii.EtsStore

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :artscii_web, ArtsciiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
