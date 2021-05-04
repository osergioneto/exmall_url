defmodule ExmallUrlWeb.LinkView do
  alias ExmallUrl.Link

  def render("create.json", %{link: %Link{path: path, to_url: to_url}}) do
    %{
      message: "Link created",
      link: %{
        path: path,
        to_url: to_url
      }
    }
  end
end
