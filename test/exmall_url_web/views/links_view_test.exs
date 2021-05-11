defmodule ExmallUrlWeb.LinkViewTest do
  use ExmallUrlWeb.ConnCase, async: true

  import Phoenix.View

  alias ExmallUrl.Link
  alias ExmallUrl.Links.Create
  alias ExmallUrlWeb.LinkView

  test "renders create.json" do
    params = %{path: "HxH", to_url: "https://hunterxhunter.fandom.com/wiki/Hunterpedia"}

    {:ok, %Link{} = link} = Create.call(params)

    response = render(LinkView, "create.json", link: link)

    expected_response = %{
      message: "Link created",
      link: %{
        path: "HxH",
        to_url: "https://hunterxhunter.fandom.com/wiki/Hunterpedia"
      }
    }

    assert expected_response == response
  end
end
