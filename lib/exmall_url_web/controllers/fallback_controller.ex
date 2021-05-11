defmodule ExmallUrlWeb.FallbackController do
  use ExmallUrlWeb, :controller

  alias ExmallUrlWeb.LinkView
  alias ExmallUrlWeb.LinkView

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(ExmallUrlWeb.ErrorView)
    |> render("404.json", result: :not_found)
  end

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ExmallUrlWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
