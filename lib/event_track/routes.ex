defmodule EventTrack.Router.Index do
  use Maru.Router
  alias EventTrack.Event
  alias EventTrack.Repo

  version "v1"

  namespace :events do
    get do
      json conn, Repo.all(Event)
    end

    params do
      requires :name, type: String
      optional :status, type: String
      optional :payload, type: Map
    end
    post do
      changeset = Event.changeset(%Event{}, params)
      case Repo.insert(changeset) do
        {:ok, event} -> json conn, event
        {:error, _changeset} ->
          conn
          |> put_status(400)
          |> text("Insert Failed")
      end
    end
  end
end
