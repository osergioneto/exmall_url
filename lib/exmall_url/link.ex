defmodule ExmallUrl.Link do
  use Ecto.Schema

  import Ecto.Changeset

  alias ExmallUrl.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:path, :to_url]
  @optional_params [:user_id]
  @path_regex ~r/^[a-z0-9]+(?:-[a-z0-9]+)*$/i
  @url_regex ~r/https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()!@:%_\+.~?#&\/\/=]*)/

  schema "links" do
    field :path, :string
    field :to_url, :string
    belongs_to(:users, User)

    timestamps()
  end

  def changeset(link \\ %__MODULE__{}, params) do
    link
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_format(:path, @path_regex)
    |> validate_format(:to_url, @url_regex)
    |> unique_constraint(:path)
  end
end
