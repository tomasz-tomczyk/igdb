defmodule Igdb.GameTest do
  use ExUnit.Case, async: false

  alias Igdb.{Config, Game}

  import TestHelper
  import Mock

  doctest Igdb.Game

  test "Find single game" do
    body = ~s([{
      "id": 359,
      "name": "Final Fantasy XV",
      "slug": "final-fantasy-xv",
      "summary": "Final Fantasy..."
    }])

    with_mock HTTPoison, get!: fn _url, _headers -> response(body) end do
      assert Game.find(359) ==
               {:ok,
                [
                  %Igdb.Game{
                    id: 359,
                    name: "Final Fantasy XV",
                    slug: "final-fantasy-xv",
                    summary: "Final Fantasy..."
                  }
                ]}

      assert called(HTTPoison.get!("#{Config.api_root()}/games/359", :_))
    end
  end
end
