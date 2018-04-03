defmodule Igdb.Collection do
  @moduledoc """
  Represents an Collection resource in the IGDB API.

  - [Collection docs](https://igdb.github.io/api/endpoints/collection/)

  ## Examples

      Igdb.Collection.get(1)
      {:ok,
      %Igdb.Collection{
        created_at: 1298843586000,
        game: nil,
        id: 1,
        name: "Bioshock",
        slug: "bioshock",
        updated_at: 1323289207000,
        url: "https://www.igdb.com/collections/bioshock"
      }}
  """

  defstruct id: nil,
            name: nil,
            slug: nil,
            url: nil,
            created_at: nil,
            updated_at: nil,
            game: nil

  use Igdb.Resource

  def resource_collection_name, do: "collections"
end
