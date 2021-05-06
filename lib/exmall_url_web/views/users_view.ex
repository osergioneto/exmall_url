defmodule ExmallUrlWeb.UsersView do
  alias ExmallUrl.User

  def render("create.json", %{user: %User{id: id, name: name, email: email}}) do
    %{
      message: "User created",
      user: %{
        id: id,
        name: name,
        email: email
      }
    }
  end
end
