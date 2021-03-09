defmodule ExmallUrlWeb.PageController do
  use ExmallUrlWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
