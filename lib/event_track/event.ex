defmodule EventTrack.Event do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(name status payload)
  @optional_fields ~w()

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Poison.Encoder, only: [:id, :name, :status, :payload]}
  schema "event" do
    field :name
    field :status
    field :payload, :map
  end

  def changeset(event, params \\ :empty) do
    event
    |> cast(params, @required_fields, @optional_fields)
  end
end
