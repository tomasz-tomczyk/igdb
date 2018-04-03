defmodule Igdb.PlayerPerspective do
  @moduledoc """
  Represents an Player Perspective resource in the IGDB API.
  """

  defstruct id: nil,
            id: nil,
            name: nil,
            slug: nil,
            url: nil,
            created_at: nil,
            updated_at: nil,
            games: nil

  use Igdb.Resource

  def resource_collection_name, do: "player_perspectives"
end
