defmodule ExmallUrl.Repo do
  use Ecto.Repo,
    otp_app: :exmall_url,
    adapter: Ecto.Adapters.Postgres
end
