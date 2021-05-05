defmodule ExmallUrl.Links.Create do
  alias Ecto
  alias ExmallUrl.{Link, Repo}

  def call(params) do
    params
    |> generate_path()
    |> Link.changeset()
    |> Repo.insert()
  end

  def generate_path(%{"path" => path} = params) when path == "",
    do: %{params | "path" => Ecto.UUID.generate()}

  def generate_path(params),
    do: params
end
