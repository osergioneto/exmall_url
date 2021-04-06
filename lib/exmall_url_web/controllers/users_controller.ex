defmodule ExmallUrlWeb.UsersController do
  use ExmallUrlWeb, :controller
  alias ExmallUrl.User

  action_fallback(ExmallUrlWeb.FallbackController)

  def create(conn, params) do
    with {:ok, %User{} = user} <- ExmallUrl.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
