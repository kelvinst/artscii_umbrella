defmodule Artscii.EtsStore do
  @moduledoc """
  Persistence store that stores canvases on a ETS table.
  """

  alias Artscii.Store

  @behaviour Store

  @impl Store
  def init, do: :ets.new(:canvases, [:named_table, :ordered_set, :public])

  @impl Store
  def create(canvas) do
    if :ets.insert_new(:canvases, {canvas.id, canvas}) do
      {:ok, canvas}
    else
      {:error, :already_exists}
    end
  end

  @impl Store
  def save(canvas) do
    :ets.insert(:canvases, {canvas.id, canvas})
    {:ok, canvas}
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
    :ets.foldl(fn({_, canvas}, acc) -> [canvas | acc] end, [], :canvases)
  end
end
