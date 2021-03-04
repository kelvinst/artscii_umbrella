defmodule ArtsciiWeb.Application do
  @moduledoc """
  This module has the function that is executed when starting
  the artscii_web application (and the helpers for it)
  """

  use Application

  @doc """
  Starts the application
  """
  def start(_type, _args) do
    children = [
      ArtsciiWeb.Telemetry,
      ArtsciiWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: ArtsciiWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @doc """
  Updates the endpoint configuration

  This function is a callback called by Elixir after a code upgrade
  """
  def config_change(changed, _new, removed) do
    ArtsciiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
