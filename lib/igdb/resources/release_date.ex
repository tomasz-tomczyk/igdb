defmodule Igdb.ReleaseDate do
  @moduledoc """
  Represents a Release Date resource in the IGDB API.
  """

  defstruct id: nil,
            game: nil,
            category: nil,
            platform: nil,
            human: nil,
            updated_at: nil,
            created_at: nil,
            date: nil,
            region: nil,
            y: nil,
            m: nil

  use Igdb.Resource

  def resource_collection_name, do: "release_dates"
end
