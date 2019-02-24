defmodule Igdb.Game do
  @moduledoc """
  Represents an Game resource in the IGDB API.

  ## Examples

  Get a single resource by its ID:

      iex> Igdb.Game.get(359)
      {:ok, %Igdb.Game{id: 359, name: "Final Fantasy XV", slug: "final-fantasy-xv", summary: "Final Fantasy XV is an action role-playing video game..."}}

  You can pass a list of IDs:

      iex> Igdb.Game.get([359, 360, 361], %{fields: "name"})
      {:ok,
      [
        %Igdb.Game{id: 359, name: "Final Fantasy XV", ... },
        %Igdb.Game{id: 360, name: "Disney's Donald Duck: Goin' Quackers", ... },
        %Igdb.Game{id: 361, name: "Far Cry 2", ... }
      ]}

  """

  use Igdb.Resource

  def resource_collection_name, do: "games"
end
