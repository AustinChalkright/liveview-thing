defmodule DemoWeb.PageLiveTest do
  use DemoWeb.ConnCase

  import Phoenix.LiveViewTest

  setup %{conn: conn} do
    {:ok, view, _html} = live(conn, DemoWeb.PageLive)
    {:ok, conn: conn, view: view}
  end

  test "loads with initial number", %{view: view} do
    assert render(view) =~ "7"
  end

  test "number increases on add event", %{conn: _conn, view: view} do
    {:ok, view, _html} = Phoenix.LiveViewTest.send_event(view, "add", %{})
    assert render(view) =~ "8"
  end
end
