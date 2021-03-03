defmodule Artscii.StoreCase do
  @moduledoc """
  This is the test case template we should use on tests
  that need to work with the store.

  The different of this type of case to an `ExUnit.Case`
  is that we clear the store before every test
  """

  use ExUnit.CaseTemplate

  setup do
    Artscii.store().clear()
  end
end
