defmodule Artscii.DetsStore do
  @moduledoc """
  Persistence store that stores canvases on a DETS table.
  """

  import Ecto.Changeset

  alias Artscii.Store

  @behaviour Store

  @impl Store
  def init, do: :dets.open_file(:canvases, file: 'canvases.dets', type: :set)

  @impl Store
  def create(changeset) do
    with {:ok, canvas} <- apply_action(changeset, :create) do
      if :dets.insert_new(:canvases, {canvas.id, canvas}) do
        {:ok, canvas}
      else
        {:error, add_error(changeset, :id, "already exists")}
      end
    end
  end

  @impl Store
  def save(changeset) do
    with {:ok, canvas} <- apply_action(changeset, :save) do
      :dets.insert(:canvases, {canvas.id, canvas})
      {:ok, canvas}
    end
  end

  @impl Store
  def fetch(id) do
    case :dets.lookup(:canvases, id) do
      [{^id, canvas}] -> {:ok, canvas}
      [] -> {:error, :not_found}
    end
  end

  @impl Store
  def list do
    fn {_, canvas}, acc -> [canvas | acc] end
    |> :dets.foldr([], :canvases)
    |> Enum.sort_by(&Map.get(&1, :id))
  end

  @impl Store
  def clear do
    :ets.delete_all_objects(:canvases)
    :ok
  end
end
