defmodule Igdb.Credits do
  @moduledoc """
  Represents an Collection resource in the IGDB API.
  """

  defstruct id: nil,
            id: nil,
            name: nil,
            slug: nil,
            url: nil,
            created_at: nil,
            updated_at: nil,
            game: nil,
            category: nil,
            company: nil,
            position: nil,
            person: nil,
            character: nil,
            person_title: nil,
            country: nil,
            credited_name: nil,
            character_credited_name: nil

  use Igdb.Resource

  def resource_collection_name, do: "credits"
end
