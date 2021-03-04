defmodule Artscii.Store do
  @moduledoc """
  Defines a persistence store.

  The persistence store is the responsible for saving
  the canvases somewhere. For example, one option is to save the 
  canvases to ETS tables, so the module should implement this 
  behaviour.
  """

  alias Artscii.Canvas
  alias Ecto.Changeset

  @doc """
  Inits the persistence layer.
  """
  @callback init() :: :ok

  @doc """
  Creates the canvas.

  Returns `{:ok, canvas}` if it works, where `canvas` is the newly saved value,
  or `{:error, changeset}` if it fails for some reason.
  """
  @callback create(Changeset.t()) :: {:ok, Canvas.t()} | {:error, Changeset.t()}

  @doc """
  Saves the canvas.

  If a canvas with the given id already exist, it updates it,
  if not, a new one is inserted.

  Returns `{:ok, canvas}` if it works, where `canvas` is the newly saved value,
  or `{:error, changeset}` if it fails for some reason.
  """
  @callback save(Changeset.t()) :: {:ok, Canvas.t()} | {:error, Changeset.t()}

  @doc """
  Fetch the canvas by it's `id`.

  Returns `{:ok, canvas}` if found, or `{:error, :not_found}` if not
  """
  @callback fetch(Canvas.id()) :: {:ok, Canvas.t()} | {:error, :not_found}

  @doc """
  Lists all canvases that are saved on the store.
  """
  @callback list() :: [Canvas.t()]

  @doc """
  Clears all canvases from the store.
  """
  @callback clear() :: :ok
end
