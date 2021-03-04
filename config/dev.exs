use Mix.Config

config :artscii_web, ArtsciiWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :plug_init_mode, :runtime

config :phoenix, :stacktrace_depth, 20
