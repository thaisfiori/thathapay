defmodule Thathapay.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Thathapay.Repo,
      # Start the Telemetry supervisor
      ThathapayWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Thathapay.PubSub},
      # Start the Endpoint (http/https)
      ThathapayWeb.Endpoint
      # Start a worker by calling: Thathapay.Worker.start_link(arg)
      # {Thathapay.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Thathapay.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ThathapayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
