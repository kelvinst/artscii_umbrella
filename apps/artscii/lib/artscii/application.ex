defmodule Artscii.Application do
  @moduledoc """
  This module has the function that is executed when starting
  the artscii application (and the helpers for it)
  """

  use Application

  def start(_type, _args) do
    children = [
      {Phoenix.PubSub, name: Artscii.PubSub}
    ]

    Artscii.store().init()

    Supervisor.start_link(children, strategy: :one_for_one, name: Artscii.Supervisor)
  end
end
