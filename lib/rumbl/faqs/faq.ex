defmodule Rumbl.Faqs.Faq do
  use Ecto.Schema
  import Ecto.Changeset

  schema "faqs" do
    field :description, :string
    field :question, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(faq, attrs) do
    faq
    |> cast(attrs, [:question, :description])
    |> validate_required([:question, :description])
  end
end
