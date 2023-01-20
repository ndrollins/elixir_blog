defmodule BlogPhx2.Repo do
  use Ecto.Repo,
    otp_app: :blog_phx2,
    adapter: Ecto.Adapters.Postgres
end
