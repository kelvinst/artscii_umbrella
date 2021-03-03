defmodule Artscii.DetsStore do
  @moduledoc """
  Persistence store that stores canvases on a DETS table.
  """

  alias Artscii.Store

  @behaviour Store

  @impl Store
  def init, do: :dets.open_file(:canvases, [file: 'canvases.dets', type: :set])

  @impl Store
  def create(canvas) do
    if :dets.insert_new(:canvases, {canvas.id, canvas}) do
      {:ok, canvas}
    else
      {:error, :already_exists}
    end
  end

  @impl Store
  def save(canvas) do
    :dets.insert(:canvases, {canvas.id, canvas})
    {:ok, canvas}
  end

  @impl Store
  def fetch(id) do
    case :dets.lookup(:canvases, id) do
      [{^id, canvas}] -> {:ok, canvas}
      [] -> {:error, :not_found}
    end
  end
end
