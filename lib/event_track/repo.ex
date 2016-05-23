defmodule EventTrack.Repo do
  use Ecto.Repo, otp_app: :event_track, adapter: Mongo.Ecto
end
