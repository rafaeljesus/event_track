defmodule EventTrack.Router.Index do
  use Maru.Router

  get do
    json conn, %{ message: :ok }
  end
end
