defmodule LiveviewFormChangeBindingWeb.Home do
  use LiveviewFormChangeBindingWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Welcome to Phoenix!</h1>
    <form phx-change="change">
      <input type="number" name="length" value={@length} />
    </form>
    <p>The length is <%= @length %></p>
    """
  end

  def mount(_params, _session, socket) do
    socket = assign(socket, length: 1)
    {:ok, socket}
  end

  def handle_event("change", _params, socket) do
    length = socket.assigns.length + 1
    socket = assign(socket, length: length)
    {:noreply, socket}
  end
end
