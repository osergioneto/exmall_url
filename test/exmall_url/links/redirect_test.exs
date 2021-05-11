defmodule ExmallUrl.Links.RedirectTest do
  use ExmallUrl.DataCase, async: true

  alias ExmallUrl.Links.{Create, Redirect}

  describe "Redirect.call/1" do
    test "when path dont exist, return an error" do
      params = %{"path" => Ecto.UUID.generate()}

      assert {:error, :not_found} = Redirect.call(params)
    end

    test "when path is found, return a link" do
      params = %{"path" => Ecto.UUID.generate(), "to_url" => "https://elixir-lang.org/"}

      {:ok, link} = Create.call(params)

      assert {:ok, link} == Redirect.call(%{"path" => link.path})
    end
  end
end
