defmodule EventTrack.Event do
  use Ecto.Schema
  import Ecto.Query
  import Ecto.Changeset
  alias EventTrack.{Repo, Event}

  @required_fields ~w(name status payload)
  @optional_fields ~w()

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Poison.Encoder, only: [:id, :name, :status, :payload]}
  schema "event" do
    field :name
    field :status
    field :payload, :map
  end

  def search(params \\ :empty) do
    query = from e in Event,
      where: e.name == ^params.name
    Repo.all(query)
  end

  def create(params) do
    changeset(%Event{}, params)
    |> Repo.insert
  end

  def changeset(event, params \\ :empty) do
    event
    |> cast(params, @required_fields, @optional_fields)
  end
end
