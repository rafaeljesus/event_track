defmodule EventTrack.Router.Index do
  use Maru.Router
  alias EventTrack.{Repo, Search, Event}

  version "v1"

  namespace :events do
    get do
      conn = fetch_query_params(conn)
      events = Search.new(conn.params)
      json conn, events
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
