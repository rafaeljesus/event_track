defmodule EventTrack.Mixfile do
  use Mix.Project

  def project do
    [app: :event_track,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :maru, :ecto, :mongodb_ecto],
      mod: {EventTrack, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:maru, "~> 0.9.6"},
      {:cors_plug, "~> 1.1"},
      {:ecto, "~> 1.0"},
      {:mongodb_ecto, "~> 0.1.4"}
    ]
  end
end
