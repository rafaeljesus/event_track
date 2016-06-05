defmodule EventTrack.SearchTest do
  use ExUnit.Case
  alias EventTrack.{Search}

  test "should create new searcheable struct" do
    page = Search.new %{"name" => "foo"}
    assert page.events == []
    assert page.page_number == 1
    assert page.page_size == 10
    assert page.total_pages == 0
  end
end
