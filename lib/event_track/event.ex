defmodule EventTrack.Event do
  use Ecto.Schema

  import Ecto.Changeset

  @required_fields ~w(name)
  @optional_fields ~w(status, paylaod)

  schema "event" do
    field :name
    field :status
    field :paylaod, :map
  end

  def changeset(event, params \\ :empty) do
    event
    |> cast(params, @required_fields, @optional_fields)
  end
end
