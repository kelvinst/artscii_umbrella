defmodule ArtsciiWeb.Endpoint do
  @moduledoc """
  The endpoint is the starting point for the web app.

  Here we configure the plugs that are going to apply to 
  every request.

  Note: the plugs in here are executed sequentially.
  """

  use Phoenix.Endpoint, otp_app: :artscii_web

  @session_options [
    store: :cookie,
    key: "_artscii_web_key",
    signing_salt: "/trqbmot"
  ]

  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]

  plug Plug.Static,
    at: "/",
    from: :artscii_web,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug ArtsciiWeb.Router
end
