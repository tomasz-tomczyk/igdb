defmodule Igdb.Character do
  @moduledoc """
  Represents an Character resource in the IGDB API.
  """

  defstruct id: nil,
            name: nil,
            slug: nil,
            url: nil,
            created_at: nil,
            updated_at: nil,
            mug_shot: nil,
            gender: nil,
            akas: nil,
            species: nil,
            games: nil,
            people: nil

  use Igdb.Resource

  def resource_collection_name, do: "characters"
end
