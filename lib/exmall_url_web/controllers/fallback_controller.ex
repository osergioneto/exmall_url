defmodule ExmallUrlWeb.FallbackController do
  use ExmallUrlWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ExmallUrlWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
