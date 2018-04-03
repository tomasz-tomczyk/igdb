defmodule Igdb.Person do
  @moduledoc """
  Represents an Person resource in the IGDB API.
  """

  defstruct id: nil,
            name: nil,
            slug: nil,
            url: nil,
            created_at: nil,
            updated_at: nil,
            mug_shot: nil,
            games: nil,
            characters: nil,
            voice_acted: nil

  use Igdb.Resource

  def resource_collection_name, do: "people"
end
