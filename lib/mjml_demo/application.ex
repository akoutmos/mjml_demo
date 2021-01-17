defmodule MjmlDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      MjmlDemo.Repo,
      # Start the Telemetry supervisor
      MjmlDemoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MjmlDemo.PubSub},
      # Start the Endpoint (http/https)
      MjmlDemoWeb.Endpoint
      # Start a worker by calling: MjmlDemo.Worker.start_link(arg)
      # {MjmlDemo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MjmlDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MjmlDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
