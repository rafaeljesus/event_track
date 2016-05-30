defmodule EventTrack.Event do
  use Ecto.Schema
  import Ecto.Query
  import Ecto.Changeset
  alias EventTrack.{Repo, Event, Paginator}

  @required_fields ~w(name status payload)
  @optional_fields ~w()

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Poison.Encoder, only: [:id, :name, :status, :payload]}
  @timestamps_opts
  schema "event" do
    field :name
    field :status
    field :payload, :map
  end

  def search(params \\ :empty) do
    page = Event
      |> where([e], e.name == ^params["name"])
      |> Paginator.new(params)

    %{
      events: page.entries,
      page_number: page.page_number,
      page_size: page.page_size,
      total_pages: page.total_pages,
    }
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
