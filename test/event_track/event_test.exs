defmodule EventTrack.EventTest do
  use ExUnit.Case
  alias EventTrack.{Repo, Event}
  import List

  @body %{
    "name" => "order_created",
    "status" => "success",
    "payload" => %{
      "price" => 2.00,
      "quantity" => 1,
      "description" => "foo"
    }
  }

  setup do
    on_exit fn ->
      Repo.delete_all(Event)
    end
  end

  test "should create event" do
    case Event.create(@body) do
      {:ok, model} -> assert model.name == @body["name"]
    end
  end

  test "should search by name" do
    models = with {:ok, model} <- Event.create(@body),
      do: Event.search(%{"name" => model.name})

    assert 1 == length models
    assert @body["name"] == first(models).name
  end
end
