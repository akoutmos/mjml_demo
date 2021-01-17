defmodule MjmlDemo.Repo do
  use Ecto.Repo,
    otp_app: :mjml_demo,
    adapter: Ecto.Adapters.Postgres
end
