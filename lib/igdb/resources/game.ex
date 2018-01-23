defmodule Igdb.Game do
  @moduledoc """
  Represents an Game resource in the IGDB API.
  """

  defstruct id: nil,
            name: nil,
            slug: nil,
            summary: nil

  alias Igdb.Api

  @doc ~S"""
  Finds a single game by id.

  ## Examples

      Igdb.Game.find(359)
      [%Igdb.Game{id: 359, name: "Final Fantasy XV", slug: "final-fantasy-xv", summary: "Final Fantasy XV is an action role-playing video game..."}]

  """
  @spec find(integer) :: tuple
  def find(game_id) do
    "games/#{game_id}"
    |> Api.request(:collection, __MODULE__)
  end
end
