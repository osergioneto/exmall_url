defmodule ExmallUrlWeb.PageControllerTest do
  use ExmallUrlWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Shorten Any Link"
  end

  # TODO: Add test to verify fallback controller
end
