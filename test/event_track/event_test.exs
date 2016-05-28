defmodule EventTrack.EventTest do
  use ExUnit.Case
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
    on_exit fn ->
      Repo.delete_all(Event)
    end
  end

  test "should create event" do
    case Event.create(@body) do
      {:ok, model} -> assert model.name == @body.name
    end
  end

  test "should search by name" do
    assert 1 == with {:ok, model} <- Event.create(@body),
      models <- Event.search(%{name: @body.name}),
      do: length models
  end
end
