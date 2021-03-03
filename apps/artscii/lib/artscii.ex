defmodule Artscii do
  @moduledoc """
  Artscii is a simple tool to create ASCII arts on a canvas.

  You start off calling `create_canvas/1` passing the canvas id, 
  which will return you an empty `%Artscii.Canvas{}` and set the id 
  you sent:

      iex> Artscii.create_canvas("davinci")
      {:ok, %Artscii.Canvas{id: "davinci"}}

  """

  alias Artscii.Canvas

  @typedoc "A canvas persistence store"
  @type store :: atom()

  @doc """
  Returns the configured persistence store
  """
  @spec store() :: store()
  def store, do: Application.get_env(:artscii, :store)

  @doc """
  Creates a new `%Canvas{}` with the given `id` and persists it

  Returns `{:ok, canvas}` if it passes, or `{:error, :already_exists}`
  if it already exists

  ## Examples

      iex> Artscii.create_canvas("picasso")
      {:ok, %Artscii.Canvas{id: "picasso"}}
      iex> Artscii.create_canvas("picasso")
      {:error, :already_exists}
      
  """
  @spec create_canvas(Canvas.id()) :: {:ok, Canvas.t()} | {:error, :already_exists}
  def create_canvas(id) do
    store().create(%Canvas{id: id})
  end
end
