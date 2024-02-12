defmodule LiveviewFormChangeBinding.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LiveviewFormChangeBindingWeb.Telemetry,
      LiveviewFormChangeBinding.Repo,
      {DNSCluster,
       query: Application.get_env(:liveview_form_change_binding, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LiveviewFormChangeBinding.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: LiveviewFormChangeBinding.Finch},
      # Start a worker by calling: LiveviewFormChangeBinding.Worker.start_link(arg)
      # {LiveviewFormChangeBinding.Worker, arg},
      # Start to serve requests, typically the last entry
      LiveviewFormChangeBindingWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveviewFormChangeBinding.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveviewFormChangeBindingWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
