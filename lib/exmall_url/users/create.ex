defmodule ExmallUrl.Users.Create do
  alias ExmallUrl.{Repo, User}

  def call(params) do
    Repo.insert(User.changeset(params))
  end
end
