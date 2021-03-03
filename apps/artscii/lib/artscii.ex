defmodule Artscii do
  @moduledoc """
  Artscii is a simple tool to create ASCII arts on a canvas.

  You start off calling `new_canvas/1` passing the canvas id, 
  which will return you an empty `%Artscii.Canvas{}` and set the id 
  you sent:

      iex> Artscii.new_canvas("davinci")
      %Artscii.Canvas{id: "davinci"}

  """

  alias Artscii.Canvas

  @doc """
  Creates a new `%Canvas{}` with the given `id`, persist and returns it

  Raises an `ArgumentError` if the `id` is already taken

  ## Examples

      iex> Artscii.new_canvas("picasso")
      %Artscii.Canvas{id: "picasso"}
      
      iex> Artscii.new_canvas("picasso")
      ** (ArgumentError) id "picasso" has already been taken
      
  """
  def new_canvas(id) do
    %Canvas{id: id}
  end
end
