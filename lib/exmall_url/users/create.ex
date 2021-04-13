defmodule ExmallUrl.Users.Create do
  alias ExmallUrl.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
