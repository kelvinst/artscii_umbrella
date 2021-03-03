defmodule Artscii do
  @moduledoc """
  Artscii is a simple tool to create ASCII arts on a canvas.

  You start off calling `new_canvas/1` passing the canvas unique id, 
  which will return you an empty `%Artscii.Canvas{}` and set its id:

      iex> Artscii.new_canvas("unique")
      %Artscii.Canvas{id: "unique"}

  """
end
