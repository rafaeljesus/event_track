defmodule EventTrack.Search do
  import Ecto.Query
  alias EventTrack.{Event, Paginator}

  def new(params) do
    page = Event
    |> where([e], e.name == ^params["name"])
    |> Paginator.new(params)

    %{
      events: page.entries,
      page_number: page.page_number,
      page_size: page.page_size,
      total_pages: page.total_pages,
    }
  end
end
