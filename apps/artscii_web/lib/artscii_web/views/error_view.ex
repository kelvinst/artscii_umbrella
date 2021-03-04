defmodule ArtsciiWeb.ErrorView do
  @moduledoc """
  The view that renders errors
  """

  use Phoenix.View, root: "lib/artscii_web/templates", namespace: ArtsciiWeb

  @doc """
  This is the function called when no template is found.

  By default, it returns the status message from
  the template name. For example, "404.json" becomes
  "Not Found".
  """
  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
