defmodule RumblWeb.FaqControllerTest do
  use RumblWeb.ConnCase

  import Rumbl.FaqsFixtures

  @create_attrs %{description: "some description", question: "some question"}
  @update_attrs %{description: "some updated description", question: "some updated question"}
  @invalid_attrs %{description: nil, question: nil}

  describe "index" do
    test "lists all faqs", %{conn: conn} do
      conn = get(conn, ~p"/faqs")
      assert html_response(conn, 200) =~ "Listing Faqs"
    end
  end

  describe "new faq" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/faqs/new")
      assert html_response(conn, 200) =~ "New Faq"
    end
  end

  describe "create faq" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/faqs", faq: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/faqs/#{id}"

      conn = get(conn, ~p"/faqs/#{id}")
      assert html_response(conn, 200) =~ "Faq #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/faqs", faq: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Faq"
    end
  end

  describe "edit faq" do
    setup [:create_faq]

    test "renders form for editing chosen faq", %{conn: conn, faq: faq} do
      conn = get(conn, ~p"/faqs/#{faq}/edit")
      assert html_response(conn, 200) =~ "Edit Faq"
    end
  end

  describe "update faq" do
    setup [:create_faq]

    test "redirects when data is valid", %{conn: conn, faq: faq} do
      conn = put(conn, ~p"/faqs/#{faq}", faq: @update_attrs)
      assert redirected_to(conn) == ~p"/faqs/#{faq}"

      conn = get(conn, ~p"/faqs/#{faq}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, faq: faq} do
      conn = put(conn, ~p"/faqs/#{faq}", faq: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Faq"
    end
  end

  describe "delete faq" do
    setup [:create_faq]

    test "deletes chosen faq", %{conn: conn, faq: faq} do
      conn = delete(conn, ~p"/faqs/#{faq}")
      assert redirected_to(conn) == ~p"/faqs"

      assert_error_sent 404, fn ->
        get(conn, ~p"/faqs/#{faq}")
      end
    end
  end

  defp create_faq(_) do
    faq = faq_fixture()
    %{faq: faq}
  end
end
