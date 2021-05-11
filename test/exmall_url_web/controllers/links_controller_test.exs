defmodule ExmallUrlWeb.LinksControllerTest do
  use ExmallUrlWeb.ConnCase, async: true

  alias ExmallUrl.Links.Create

  describe "POST /links" do
    test "should return status 201 and create link when POST to route /api/links", %{conn: _conn} do
      %{resp_body: resp_body, status: status} =
        post(build_conn(), "/api/links",
          path: "narutinho",
          to_url: "https://pt.wikipedia.org/wiki/Naruto"
        )

      {:ok, resp} = Jason.decode(resp_body)

      assert status == 201

      assert resp == %{
               "message" => "Link created",
               "link" => %{
                 "path" => "narutinho",
                 "to_url" => "https://pt.wikipedia.org/wiki/Naruto"
               }
             }
    end

    test "should return status 400 and error when POST path is empty", %{conn: _conn} do
      %{resp_body: resp_body, status: status} =
        post(build_conn(), "/api/links",
          to_url: "https://pt.wikipedia.org/wiki/Boku_no_Hero_Academia"
        )

      {:ok, resp} = Jason.decode(resp_body)

      assert status == 400
      assert resp == %{"message" => %{"path" => ["can't be blank"]}}
    end
  end

  describe "GET /links" do
    test "should return status 404 and error when link dont exist", %{conn: _conn} do
      %{resp_body: resp_body, status: status} = get(build_conn(), "/tibia")

      {:ok, resp} = Jason.decode(resp_body)

      assert status == 404
      assert resp == %{"message" => "not_found"}
    end

    test "should return status 302 and create link when POST to route /api/links", %{conn: _conn} do
      Create.call(%{
        "path" => "BNA",
        "to_url" => "https://pt.wikipedia.org/wiki/Boku_no_Hero_Academia"
      })

      %{resp_body: resp_body, status: status} = get(build_conn(), "/BNA")

      assert status == 302
      assert HtmlSanitizeEx.strip_tags(resp_body) =~ "You are being redirected"
    end
  end
end
