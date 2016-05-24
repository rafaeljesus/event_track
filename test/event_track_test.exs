defmodule EventTrackTest do
  use ExUnit.Case
  use Maru.Test, for: EventTrack.API

  test "/events" do
    assert %Plug.Conn{} = conn(:get, "/events") |> make_response
  end
end
