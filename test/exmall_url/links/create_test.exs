defmodule ExmallUrl.Links.CreateTest do
  use ExmallUrl.DataCase, async: true

  alias ExmallUrl.Links.Create

  describe "Links.call/1" do
    test "when all params are valid, return an link" do
      params = %{
        path: "google",
        to_url: "https://www.google.com.br"
      }

      assert {:ok, %{path: "google", to_url: "https://www.google.com.br", user_id: nil}} =
               Create.call(params)
    end

    test "when path is not send, return errors" do
      params = %{
        to_url: "https://hexdocs.pm/ecto"
      }

      assert {:error,
              %Ecto.Changeset{errors: [path: {"can't be blank", [validation: :required]}]}} =
               Create.call(params)
    end

    test "when path is empty string, return link with path as UUID" do
      params = %{
        "path" => "",
        "to_url" => "https://hexdocs.pm/ecto"
      }

      {:ok, link} = Create.call(params)

      assert "https://hexdocs.pm/ecto" == link.to_url
      assert {:ok, link.path} == Ecto.UUID.cast(link.path)
    end
  end
end
