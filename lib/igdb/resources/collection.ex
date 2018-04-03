defmodule Igdb.Collection do
  @moduledoc """
  Represents an Collection resource in the IGDB API.
  """

  defstruct id: nil,
            name: nil,
            slug: nil,
            url: nil,
            created_at: nil,
            updated_at: nil,
            game: nil

  use Igdb.Resource

  def resource_collection_name, do: "characters"
end
