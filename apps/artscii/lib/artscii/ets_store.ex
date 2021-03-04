defmodule Artscii.EtsStore do
  @moduledoc """
  Persistence store that stores canvases on a ETS table.
  """

  import Ecto.Changeset

  alias Artscii.Store

  @behaviour Store

  @impl Store
  def init, do: :ets.new(:canvases, [:named_table, :ordered_set, :public])

  @impl Store
  def create(changeset) do
    with {:ok, canvas} <- apply_action(changeset, :create) do
      if :ets.insert_new(:canvases, {canvas.id, canvas}) do
        {:ok, canvas}
      else
        {:error, add_error(changeset, :id, "already exists")}
      end
    end
  end

  @impl Store
  def save(changeset) do
    with {:ok, canvas} <- apply_action(changeset, :save) do
      :ets.insert(:canvases, {canvas.id, canvas})
      {:ok, canvas}
    end
  end

  @impl Store
  def fetch(id) do
    case :ets.lookup(:canvases, id) do
      [{^id, canvas}] -> {:ok, canvas}
      [] -> {:error, :not_found}
    end
  end

  @impl Store
  def list do
    :ets.foldr(fn {_, canvas}, acc -> [canvas | acc] end, [], :canvases)
  end

  @impl Store
  def clear do
    :ets.delete_all_objects(:canvases)
    :ok
  end
end
