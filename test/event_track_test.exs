defmodule EventTrackTest do
  use ExUnit.Case
  use Maru.Test, for: EventTrack.API

  test "GET /v1/events" do
    conn = conn(:get, "/v1/events") |> make_response
    assert conn.state == :sent
    assert conn.status == 200
  end

  test "POST /v1/events" do
    body = %{
      name: "order_created",
      status: "success",
      payload: %{
        price: 2.00,
        quantity: 1,
        description: "foo"
      }
    }
    conn = conn(:post, "/v1/events", body)
    |> put_req_header("content-type", "application/json")
    |> make_response

    assert conn.state == :sent
    assert conn.status == 200
  end
end
