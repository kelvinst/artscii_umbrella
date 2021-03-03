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
  Creates a new `%Canvas{}` with the given `id` and returns it

  ## Examples

      iex> Artscii.new_canvas("picasso")
      %Artscii.Canvas{id: "picasso"}
      
  """
  def new_canvas(id) do
    %Canvas{id: id}
  end
end
