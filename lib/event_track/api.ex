defmodule EventTrack.API do
  use Maru.Router

  plug Plug.Logger

  mount EventTrack.Router.Index

  rescue_from :all do
    conn
    |> put_status(500)
    |> text("Server Error")
  end
end
