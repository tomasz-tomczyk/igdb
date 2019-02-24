defmodule Igdb.Game do
  @moduledoc """
  Represents an Game resource in the IGDB API.

  ## Examples

  Search games

      iex> Igdb.Game.search(fields: "*", sort: "popularity desc")
      {:ok,
        [
          %Igdb.Game{
            popularity: 6868.73640346133,
            url: "https://www.igdb.com/games/anthem",
            summary: "Anthem is a shared-world action RPG, where players can delve into a vast landscape teeming with amazing technology and forgotten treasures. This is a world where Freelancers are called upon to defeat savage beasts, ruthless marauders, and forces plotting to conquer humanity.",
            name: "Anthem",
            ...
          },
          ...
        ]
      }
  """

  use Igdb.Resource

  defstruct age_ratings: nil,
            aggregated_rating: nil,
            aggregated_rating_count: nil,
            alternative_names: nil,
            artworks: nil,
            bundles: nil,
            category: nil,
            collection: nil,
            cover: nil,
            created_at: nil,
            dlcs: nil,
            expansions: nil,
            external_games: nil,
            first_release_date: nil,
            follows: nil,
            franchise: nil,
            franchises: nil,
            game_engines: nil,
            game_modes: nil,
            genres: nil,
            hypes: nil,
            involved_companies: nil,
            keywords: nil,
            multiplayer_modes: nil,
            name: nil,
            parent_game: nil,
            platforms: nil,
            player_perspectives: nil,
            popularity: nil,
            pulse_count: nil,
            rating: nil,
            rating_count: nil,
            release_dates: nil,
            screenshots: nil,
            similar_games: nil,
            slug: nil,
            standalone_expansions: nil,
            status: nil,
            storyline: nil,
            summary: nil,
            tags: nil,
            themes: nil,
            time_to_beat: nil,
            total_rating: nil,
            total_rating_count: nil,
            updated_at: nil,
            url: nil,
            version_parent: nil,
            version_title: nil,
            videos: nil,
            websites: nil

  def resource_collection_name, do: "games"
end
