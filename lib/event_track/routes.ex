defmodule EventTrack.Router.Index do
  use Maru.Router
  alias EventTrack.Event

  version "v1"

  namespace :events do
    get do
      fetch_query_params(conn, params)
      IO.inspect(params)
      json conn, Event.search(params)
    end

    params do
      requires :name, type: String
      optional :status, type: String
      optional :payload, type: Map
    end
    post do
      case Event.create(params) do
        {:ok, event} -> json conn, event
        {:error, _changeset} ->
          conn
          |> put_status(400)
          |> text("Insert Failed")
      end
    end
  end
end
