defmodule ExmallUrlWeb.UsersControllerTest do
  use ExmallUrlWeb.ConnCase, async: true

  alias ExmallUrl.User

  describe "POST /users" do
    test "should return status 201 and create user when POST to route /api/users", %{conn: conn} do
      %{resp_body: resp_body, status: status} = post(build_conn(), "/api/users", [name: "Sérgio Neto", email: "sergio@email.com", password: "123456"])
      {:ok, resp} = Jason.decode(resp_body)

      assert status == 201
      assert resp == %{
        "message" => "User created",
        "user" => %{
          "email" => "sergio@email.com",
          "id" => resp["user"]["id"],
          "name" => "Sérgio Neto"
        }
      }
    end

    test "should return status 400 and error when POST when params are incorret", %{conn: conn} do
      %{resp_body: resp_body, status: status} = post(build_conn(), "/api/users", [name: "Sérgio Neto", email: "not-mail", password: "123456"])
      {:ok, resp} = Jason.decode(resp_body)

      assert status == 400
      assert resp == %{"message" => %{"email" => ["has invalid format"]}}
    end
  end
end
