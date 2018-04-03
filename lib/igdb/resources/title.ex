defmodule Igdb.Title do
  @moduledoc """
  Represents an Title resource in the IGDB API.
  """

  defstruct id: nil,
            name: nil,
            slug: nil,
            url: nil,
            created_at: nil,
            updated_at: nil,
            description: nil,
            games: nil

  use Igdb.Resource

  def resource_collection_name, do: "titles"
end
