defmodule EventTrack do
  use Application

  def start(_type, _args) do
    EventTrack.Supervisor.start_link
  end
end
