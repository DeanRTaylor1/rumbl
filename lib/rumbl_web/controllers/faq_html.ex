defmodule RumblWeb.FaqHTML do
  use RumblWeb, :html

  embed_templates "faq_html/*"

  @doc """
  Renders a faq form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def faq_form(assigns)
end
