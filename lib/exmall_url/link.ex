defmodule ExmallUrl.Link do
  use Ecto.Schema

  import Ecto.Changeset

  alias ExmallUrl.User

  @required_params [:path, :to_url]
  @optional_params [:user_id]

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
    # add regex
    |> validate_format(:path, ~r{a})
    # add regex
    |> validate_format(:to_url, ~r{a})
    |> unique_constraint(:path)
  end
end
