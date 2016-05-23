defmodule EventTrack.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init([]) do
    [worker(EventTrack.Repo, [[host: "db", port: 27017]])]
    |> supervise(strategy: :one_for_one)
  end
end

