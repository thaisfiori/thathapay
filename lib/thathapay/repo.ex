defmodule Thathapay.Repo do
  use Ecto.Repo,
    otp_app: :thathapay,
    adapter: Ecto.Adapters.Postgres
end
