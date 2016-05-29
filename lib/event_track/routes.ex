defmodule EventTrack.Router.Index do
  use Maru.Router
  import Ecto.Query
  alias EventTrack.{Repo, Event}

  version "v1"

  namespace :events do
    get do
      conn = fetch_query_params(conn)
      json conn, Event.search(conn.params)
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
