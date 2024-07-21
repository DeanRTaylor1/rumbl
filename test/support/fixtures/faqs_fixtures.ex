defmodule Rumbl.FaqsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rumbl.Faqs` context.
  """

  @doc """
  Generate a faq.
  """
  def faq_fixture(attrs \\ %{}) do
    {:ok, faq} =
      attrs
      |> Enum.into(%{
        description: "some description",
        question: "some question"
      })
      |> Rumbl.Faqs.create_faq()

    faq
  end
end
