defmodule EventTrack.Event do
  use Ecto.Model

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "event" do
    field :name
  end
end
