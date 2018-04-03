defmodule Igdb.Game do
  @moduledoc """
  Represents an Game resource in the IGDB API.
  """

  defstruct id: nil,
            name: nil,
            slug: nil,
            url: nil,
            created_at: nil,
            updated_at: nil,
            summary: nil,
            storyline: nil,
            collection: nil,
            franchise: nil,
            hypes: nil,
            popularity: nil,
            rating: nil,
            rating_count: nil,
            aggregated_rating: nil,
            aggregated_rating_count: nil,
            total_rating: nil,
            total_rating_count: nil,
            game: nil,
            version_parent: nil,
            developers: nil,
            publishers: nil,
            game_engines: nil,
            game_engines: nil,
            category: nil,
            time_to_beat: nil,
            player_perspectives: nil,
            game_modes: nil,
            keywords: nil,
            themes: nil,
            genres: nil,
            first_release_date: nil,
            status: nil,
            release_dates: nil,
            alternative_names: nil,
            screenshots: nil,
            videos: nil,
            cover: nil,
            esrb: nil,
            pegi: nil,
            websites: nil,
            tags: nil,
            dlcs: nil,
            expansions: nil,
            standalone_expansions: nil,
            bundles: nil,
            games: nil,
            external: nil

  use Igdb.Resource

  def resource_collection_name, do: "games"
end
