defmodule SmartGitWeb.Page.RepoDetailTest do
  use SmartGitWeb.ConnCase

  import Phoenix.LiveViewTest

  test "load repo element", %{conn: conn} do
    {:ok, view, _html} = live(conn, Routes.page_path(conn, :index))

    assert has_element?(view, "#repo-1")
    assert has_element?(view, "[data-role=language][data-id=repo-1]", "elixir language")
    assert has_element?(view, "[data-role=watchers][data-id=repo-1]", "500")
    assert has_element?(view, "[data-role=description][data-id=repo-1]", "loewm ipsum")
    assert has_element?(view, "[data-role=button-action][data-id=repo-1]")
    refute has_element?(view, "[data-role=show-message][data-id=repo-1]", "repo added!")
  end

  test "when click add repo show success msg", %{conn: conn} do
    {:ok, view, _html} = live(conn, Routes.page_path(conn, :index))
    refute has_element?(view, "[data-role=show-message][data-id=repo-1]", "repo added!")
    # open_browser(view)
    view |> element("[data-role=button-action][data-id=repo-1]") |> render_click()
    assert has_element?(view, "[data-role=show-message][data-id=repo-1]")
  end
end
