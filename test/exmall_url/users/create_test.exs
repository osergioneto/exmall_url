defmodule ExmallUrl.Users.CreateTest do
  use ExmallUrl.DataCase, async: true

  alias ExmallUrl.User
  alias ExmallUrl.Users.Create

  describe "call/1" do
    test "when all params are valid, return an user" do
      params = %{name: "Gaia Regina", email: "gaia@email.com", password: "123456"}

      {:ok, %User{id: user_id, email: email, name: name}} = Create.call(params)

      assert %{ id: user_id, name: "Gaia Regina", email: "gaia@email.com"} == %{id: user_id, name: name, email: email}
    end

  end
end
