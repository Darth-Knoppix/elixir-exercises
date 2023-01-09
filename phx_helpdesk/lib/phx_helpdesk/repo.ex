defmodule PhxHelpdesk.Repo do
  # use Ecto.Repo,
  #   otp_app: :phx_helpdesk,
  #   adapter: Ecto.Adapters.Postgres
  use AshPostgres.Repo, otp_app: :phx_helpdesk
end
