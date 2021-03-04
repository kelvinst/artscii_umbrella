use Mix.Config

config :artscii, store: Artscii.EtsStore

config :artscii_web, ArtsciiWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn
