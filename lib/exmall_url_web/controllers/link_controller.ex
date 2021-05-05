defmodule ExmallUrlWeb.LinkController do
  use ExmallUrlWeb, :controller
  alias ExmallUrl.Link
  alias ExmallUrl.Links.{Create, Redirect}

  action_fallback(ExmallUrlWeb.FallbackController)

  def create(conn, params) do
    with {:ok, %Link{} = link} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render("create.json", link: link)
    end
  end

  def show(conn, params) do
    with {:ok, %Link{to_url: to_url}} <- Redirect.call(params) do
      conn
      |> put_status(:found)
      |> redirect(external: to_url)
    end
  end
end
