defmodule ArtsciiTest do
  use Artscii.StoreCase

  doctest Artscii

  describe "create_canvas/1" do
    test "creates an empty canvas with default dimensions" do
      {:ok, canvas} = Artscii.create_canvas("id")
      assert canvas.id == "id"
      assert canvas.height == 20
      assert canvas.width == 20
      assert canvas.drawings == []
    end
  end
end
