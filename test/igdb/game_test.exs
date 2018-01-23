defmodule Igdb.GameTest do
  use ExUnit.Case, async: false

  alias Igdb.Config
  import TestHelper
  import Mock

  doctest Igdb.Game

  test "test_name" do
    body = ~s([{
      "id": 359,
      "name": "Final Fantasy XV",
      "slug": "final-fantasy-xv",
      "summary": "Final Fantasy..."
    }])

    with_mock HTTPoison, get: fn _url -> response(body) end do
      assert Igdb.Game.find(359) == %Igdb.Game{
               id: 359,
               name: "Final Fantasy XV",
               slug: "final-fantasy-xv",
               summary: "Final Fantasy..."
             }

      assert called(HTTPoison.get("#{Config.api_root()}/games/359"))
    end
  end
end
