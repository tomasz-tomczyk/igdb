defmodule Igdb.Character do
  @moduledoc """
  Represents an Character resource in the IGDB API.

  - [Character docs](https://igdb.github.io/api/endpoints/character/)

  ## Examples

      Igdb.Character.search(%{fields: "*", order: "created_at:asc", limit: 1})
      {:ok,
      [
        %Igdb.Character{
          akas: nil,
          created_at: 1384003893461,
          games: 'I',
          gender: 2,
          id: 1,
          mug_shot: %{
            "cloudinary_id" => "prnqmxc3v0racivehw6l",
            "height" => 550,
            "url" => "//images.igdb.com/igdb/image/upload/t_thumb/prnqmxc3v0racivehw6l.jpg",
            "width" => 650
          },
          name: "Urdnot Wrex",
          people: [421],
          slug: "urdnot-wrex",
          species: 5,
          updated_at: 1512377108353,
          url: "https://www.igdb.com/characters/urdnot-wrex"
        }
      ]}
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
