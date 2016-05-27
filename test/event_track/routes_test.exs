defmodule EventTrack.RouterTest do
  use ExUnit.Case
  use Maru.Test, for: EventTrack.API

  alias EventTrack.Repo
  alias EventTrack.Event

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
    changeset = Event.changeset(%Event{}, @body)
    case Repo.insert(changeset) do
      {:ok, model} -> assert model.name == @body.name
      {:error, _changeset} -> assert changeset.valid?
    end

    on_exit fn ->
      Repo.delete_all(Event)
    end
  end

  test "GET /v1/events" do
    conn = conn(:get, "/v1/events") |> make_response
    assert conn.state == :sent
    assert conn.status == 200
  end

  test "POST /v1/events" do
    conn = conn(:post, "/v1/events", @body)
    |> put_req_header("content-type", "application/json")
    |> make_response

    assert conn.state == :sent
    assert conn.status == 200
  end
end
