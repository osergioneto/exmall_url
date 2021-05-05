defmodule ExmallUrl.Links.Redirect do
  alias ExmallUrl.{Link, Repo}

  def call(%{"path" => path}) do
    case Repo.get_by(Link, path: path) do
      nil -> {:error, :not_found}
      link -> {:ok, link}
    end
  end
end
