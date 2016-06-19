use Mix.Config

config :maru, EventTrack.API,
  versioning: [
    using: :path
  ],
  http: [port: 3000]

config :event_track, EventTrack.Repo,
  database: "events_track_test",
  hostname: "localhost"
