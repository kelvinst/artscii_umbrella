defmodule Artscii do
  @moduledoc """
  Artscii is a simple tool to create ASCII arts on a canvas.

  You start off calling `new_canvas/1` passing the canvas id, 
  which will return you an empty `%Artscii.Canvas{}` and set the id 
  you sent:

      iex> Artscii.new_canvas("davinci")
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

      iex> Artscii.new_canvas("picasso")
      {:ok, %Artscii.Canvas{id: "picasso"}}
      
      iex> Artscii.new_canvas("picasso")
      {:error, :already_exists}
      
  """
  @spec new_canvas(Canvas.id()) :: Canvas.t()
  def new_canvas(id) do
    store().create(%Canvas{id: id})
  end
end
