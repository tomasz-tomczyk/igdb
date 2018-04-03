defmodule Igdb.GameVersion do
  @moduledoc """
  Represents an Game Versions resource in the IGDB API.
  """

  defstruct id: nil,
            id: nil,
            game: nil,
            created_at: nil,
            updated_at: nil,
            games: nil,
            url: nil,
            features: nil

  use Igdb.Resource

  def resource_collection_name, do: "game_versions"
end
