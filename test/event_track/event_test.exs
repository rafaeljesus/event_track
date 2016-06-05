defmodule EventTrack.EventTest do
  use ExUnit.Case
  alias EventTrack.{Event}

  @invalid_attrs %{}
  @valid_attrs %{
    name: "order_created",
    status: "success",
    payload: %{
      price:  2.00,
      quantity:  1,
      description: "foo"
    }
  }

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
