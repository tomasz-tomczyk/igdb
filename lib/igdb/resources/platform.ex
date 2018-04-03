defmodule Igdb.Platform do
  @moduledoc """
  Represents an Platform resource in the IGDB API.
  """

  defstruct id: nil,
            name: nil,
            slug: nil,
            url: nil,
            created_at: nil,
            updated_at: nil,
            logo: nil,
            website: nil,
            summary: nil,
            alternative_name: nil,
            generation: nil,
            games: nil,
            versions: nil

  use Igdb.Resource

  def resource_collection_name, do: "platforms"
end
