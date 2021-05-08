defmodule ExmallUrl.Links.RedirectTest do
  use ExmallUrl.DataCase, async: true

  alias ExmallUrl.Link
  alias ExmallUrl.Links.{Create, Redirect}

  describe "Redirect.call/1" do
    test "when all path is invalid valid, return an error" do
      params = %{"path" => Ecto.UUID.generate()}

      assert {:error, :not_found} = Redirect.call(params)
    end

    test "when path is found, return a link" do
      params = %{"path" => Ecto.UUID.generate(), "to_url" => "https://elixir-lang.org/"}

      {:ok, link} = Create.call(params)

      assert {:ok, link} == Redirect.call(%{"path" => link.path})
    end

    # test "when path is empty string, return link with path as UUID" do
    #   params = %{
    #     "path" => "",
    #     "to_url" => "https://hexdocs.pm/ecto"
    #   }

    #   {:ok, link} = Create.call(params)

    #   assert "https://hexdocs.pm/ecto" == link.to_url
    #   assert {:ok, link.path} == Ecto.UUID.cast(link.path)
    # end
  end
end
