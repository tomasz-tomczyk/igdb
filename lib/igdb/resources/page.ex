defmodule Igdb.Page do
  @moduledoc """
  Represents an Page resource in the IGDB API.
  """

  defstruct id: nil,
            slug: nil,
            url: nil,
            created_at: nil,
            updated_at: nil,
            name: nil,
            content: nil,
            category: nil,
            sub_category: nil,
            country: nil,
            color: nil,
            user: nil,
            game: nil,
            company: nil,
            description: nil,
            page_follows_count: nil,
            logo: nil,
            background: nil,
            facebook: nil,
            twitter: nil,
            twitch: nil,
            instagram: nil,
            youtube: nil,
            steam: nil,
            linkedin: nil,
            pinterest: nil,
            soundcloud: nil,
            google_plus: nil,
            reddit: nil,
            battlenet: nil,
            origin: nil,
            uplay: nil,
            discord: nil

  use Igdb.Resource

  def resource_collection_name, do: "pages"
end
