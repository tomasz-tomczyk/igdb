defmodule Igdb.Game do
  @moduledoc """
  Represents a Game resource in the IGDB API.

  ## Examples

  Search games

      iex> Igdb.Game.search(fields: "*", sort: "popularity desc")
      {:ok,
        [
          %{
            popularity: 6868.73640346133,
            url: "https://www.igdb.com/games/anthem",
            summary: "Anthem is a shared-world action RPG, where players can delve into a vast landscape teeming with amazing technology and forgotten treasures. This is a world where Freelancers are called upon to defeat savage beasts, ruthless marauders, and forces plotting to conquer humanity.",
            name: "Anthem",
            ...
          },
          ...
        ]
      }
  """

  use Igdb.Resource
end
