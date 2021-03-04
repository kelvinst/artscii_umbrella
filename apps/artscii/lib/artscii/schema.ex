defmodule Artscii.Schema do
  @moduledoc """
  This is the module that defines the default strategy
  for schemas on the whole system.

  To use it you just need to include `use Artscii.Schema` on
  you module.
  """

  defmacro __using__(_) do
    quote do
      use Ecto.Schema

      import Ecto.Changeset

      @primary_key false
    end
  end
end
