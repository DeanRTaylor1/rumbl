defmodule RumblWeb.FaqController do
  use RumblWeb, :controller

  alias Rumbl.Faqs
  alias Rumbl.Faqs.Faq

  def index(conn, _params) do
    faqs = Faqs.list_faqs()
    render(conn, :index, faqs: faqs)
  end

  def new(conn, _params) do
    changeset = Faqs.change_faq(%Faq{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"faq" => faq_params}) do
    case Faqs.create_faq(faq_params) do
      {:ok, faq} ->
        conn
        |> put_flash(:info, "Faq created successfully.")
        |> redirect(to: ~p"/faqs/#{faq}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    faq = Faqs.get_faq!(id)
    render(conn, :show, faq: faq)
  end

  def edit(conn, %{"id" => id}) do
    faq = Faqs.get_faq!(id)
    changeset = Faqs.change_faq(faq)
    render(conn, :edit, faq: faq, changeset: changeset)
  end

  def update(conn, %{"id" => id, "faq" => faq_params}) do
    faq = Faqs.get_faq!(id)

    case Faqs.update_faq(faq, faq_params) do
      {:ok, faq} ->
        conn
        |> put_flash(:info, "Faq updated successfully.")
        |> redirect(to: ~p"/faqs/#{faq}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, faq: faq, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    faq = Faqs.get_faq!(id)
    {:ok, _faq} = Faqs.delete_faq(faq)

    conn
    |> put_flash(:info, "Faq deleted successfully.")
    |> redirect(to: ~p"/faqs")
  end
end
