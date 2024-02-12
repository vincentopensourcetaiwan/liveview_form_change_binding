defmodule LiveviewFormChangeBindingWeb.Home do
  use LiveviewFormChangeBindingWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Welcome to Phoenix!</h1>
    """
  end

  def mount(_params, _session, socket) do
    socket = assign(socket, length: 1)
    {:ok, socket}
  end
end
