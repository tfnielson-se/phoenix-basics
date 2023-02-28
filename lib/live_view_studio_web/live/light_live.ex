defmodule LiveViewStudioWeb.LightLive do
  use LiveViewStudioWeb, :live_view

  # mount
  def mount(_params, _seesion, socket ) do
    socket = assign(socket, brightness: 10)
    # IO.inspect(socket)
    {:ok, socket}
  end


  # render
  def render(assigns) do # assigns is a %{}
  # HEEx = HTML + EEx
    ~H"""
    <h1>Front porch Light</h1>
      <div id="light">
        <div class="meter">
          <span style={"width: #{@brightness}%"}>
          <%= @brightness %>%
          </span>
        </div>
      <button phx-click="off">
        <img src="/images/light-off.svg">
      </button>
      <button phx-click="down">
        <img src="/images/down.svg">
      </button>
      <button phx-click="up">
        <img src="/images/up.svg">
      </button>
      <button phx-click="on">
        <img src="/images/light-on.svg">
      </button>
      </div>
    """
  end

  # handle_event/3 :name_of_event, event related payload
  def handle_event("on", _, socket) do
    socket = assign(socket, brightness: 100)
    {:noreply, socket}
  end

  def handle_event("off", _, socket) do
    socket = assign(socket, brightness: 0)
    {:noreply, socket}
  end

  def handle_event("up", _, socket) do
    brightness = socket.assigns.brightness + 10
    socket = assign(socket, brightness: brightness)
    {:noreply, socket}
  end

  def handle_event("down", _, socket) do
    brightness = socket.assign.brightness
    socket = assign(socket, brightness: brightness - 10)
    {:noreply, socket}
  end



end
