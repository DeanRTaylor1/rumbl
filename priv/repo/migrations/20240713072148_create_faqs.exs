defmodule Rumbl.Repo.Migrations.CreateFaqs do
  use Ecto.Migration

  def change do
    create table(:faqs) do
      add :question, :text
      add :description, :text

      timestamps(type: :utc_datetime)
    end
  end
end
