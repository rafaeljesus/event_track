defmodule EventTrack.RouterTest do
  use ExUnit.Case
  use Maru.Test, for: EventTrack.API
  alias EventTrack.{Repo, Event}

  @body %{
    name: "order_created",
    status: "success",
    payload: %{
      price: 2.00,
      quantity: 1,
      description: "foo"
    }
  }

  setup do
    case Event.create(@body) do
      {:ok, model} -> assert model.name == @body.name
    end

    on_exit fn ->
      Repo.delete_all(Event)
    end
  end

  # test "GET /v1/events" do
  #   conn = conn(:get, "/v1/events?name=#{@body.name}") |> make_response
  #   assert conn.state == :sent
  #   assert conn.status == 200
  # end

  test "POST /v1/events" do
    conn = conn(:post, "/v1/events", @body)
    |> put_req_header("content-type", "application/json")
    |> make_response

    assert conn.state == :sent
    assert conn.status == 200
  end
end
