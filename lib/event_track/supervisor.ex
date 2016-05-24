defmodule EventTrack.Supervisor do
  use Supervisor

  def init([]) do
    [worker(EventTrack.Repo, [])]
    |> supervise(strategy: :one_for_one)
  end

  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end
end

