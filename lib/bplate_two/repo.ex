defmodule BplateTwo.Repo do
  use Ecto.Repo,
    otp_app: :bplate_two,
    adapter: Ecto.Adapters.Postgres
end
