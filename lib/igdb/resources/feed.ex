defmodule Igdb.Feed do
  @moduledoc """
  Represents an Feed resource in the IGDB API.
  """

  defstruct id: nil,
            url: nil,
            created_at: nil,
            updated_at: nil,
            content: nil,
            category: nil,
            user: nil,
            games: nil,
            title: nil,
            feed_likes_count: nil

  use Igdb.Resource

  def resource_collection_name, do: "feeds"
end
