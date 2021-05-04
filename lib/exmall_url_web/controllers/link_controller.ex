defmodule ExmallUrlWeb.LinkController do
  use ExmallUrlWeb, :controller
  alias ExmallUrl.Link
  alias ExmallUrl.Links

  action_fallback(ExmallUrlWeb.FallbackController)

  def create(conn, params) do
    with {:ok, %Link{} = link} <- Links.call(params) do
      conn
      |> put_status(:created)
      |> render("create.json", link: link)
    end
  end
end
