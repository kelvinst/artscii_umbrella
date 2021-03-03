defmodule Artscii.Canvas do
  @moduledoc """
  The Canvas is the structure that holds the list of drawing 
  operations.
  """

  alias Artscii.Canvas

  @typedoc "The identifier of the canvas"
  @type id :: String.t()

  @typedoc "The canvas struct"
  @type t :: %Canvas{id: id()}

  @width 20
  @height 20

  defstruct [:id, width: @width, height: @height, drawing_operations: []]
end
