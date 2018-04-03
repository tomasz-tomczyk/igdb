defmodule Igdb.Keyword do
  @moduledoc """
  Represents an Keyword resource in the IGDB API.
  """

  defstruct id: nil,
            name: nil,
            slug: nil,
            url: nil,
            created_at: nil,
            updated_at: nil,
            games: nil

  use Igdb.Resource

  def resource_collection_name, do: "keywords"
end
