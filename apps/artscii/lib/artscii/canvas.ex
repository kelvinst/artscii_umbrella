defmodule Artscii.Canvas do
  @moduledoc """
  The canvas is the schema that holds the list of drawings
  """

  use Artscii.Schema

  alias Artscii.Canvas
  alias Artscii.Drawing

  @typedoc "The identifier of the canvas"
  @type id :: String.t()

  @typedoc "The canvas struct"
  @type t :: %Canvas{
          id: id(),
          height: integer(),
          width: integer(),
          drawings: list()
        }

  @width 20
  @height 20

  embedded_schema do
    field :id, :string
    field :height, :integer, default: @height
    field :width, :integer, default: @width
    embeds_many :drawings, Drawing
  end

  @doc """
  Creates a changeset that validates the canvas properties

  Returns `:ok` if all validation passes or `{:error, reason}` if not,
  where `reason` will be a string with a description of the validation
  that failed

  ## Examples

      iex> %Ecto.Changeset{valid?: true} = 
      iex>   Artscii.Canvas.changeset(%Artscii.Canvas{id: "donatello"})

      iex> %Ecto.Changeset{valid?: false, errors: errors} = 
      iex>   Artscii.Canvas.changeset(%Artscii.Canvas{id: nil})
      iex> errors
      [id: {"can't be blank", [validation: :required]}]

  """
  def changeset(struct, attrs \\ %{}) do
    struct
    |> cast(attrs, [])
    |> validate_required([:id, :height, :width])
  end
end
