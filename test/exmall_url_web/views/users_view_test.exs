defmodule ExmallUrlWeb.UsersViewTest do
  use ExmallUrlWeb.ConnCase, async: true

  import Phoenix.View

  alias ExmallUrl.User
  alias ExmallUrlWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Uzumaki Naruto",
      email: "naruto@konoha.com",
      password: "123456"
    }

    {:ok, %User{id: user_id} = user} = ExmallUrl.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      "message": "User created",
      "user": %{
        "email": "naruto@konoha.com",
        "id": user_id,
        "name": "Uzumaki Naruto"
      }
    }

    assert expected_response == response
  end
end
