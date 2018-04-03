defmodule Igdb.Credit do
  @moduledoc """
  Represents an Credit resource in the IGDB API.

  - [Credit docs](https://igdb.github.io/api/endpoints/credit/)

  ## Examples

      Igdb.Credit.search(%{fields: "*", limit: 1, expand: "person"})
      {:ok,
      [
        %Igdb.Credit{
          category: 4,
          character: nil,
          character_credited_name: nil,
          company: 3441,
          country: nil,
          created_at: 1413229824629,
          credited_name: nil,
          game: 1291,
          id: 1073795615,
          name: nil,
          person: %{
            "created_at" => 1411769315951,
            "games" => [1941, 1291, 7330, 565, 1352, 7316, 499, 1602, 512, 493, 550],
            "gender" => 0,
            "id" => 31649,
            "name" => "Sakura Wang",
            "slug" => "sakura-wang",
            "updated_at" => 1475087786271,
            "url" => "https://www.igdb.com/people/sakura-wang"
          },
          person_title: 367,
          position: 1376,
          slug: nil,
          updated_at: 1413229824629,
          url: nil
        }
      ]}

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
