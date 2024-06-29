defmodule RumblWeb.UserHTML do
  use RumblWeb, :html

  embed_templates "user_html/*"

  alias Rumbl.Accounts

  def first_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
