defmodule Igdb.Review do
  @moduledoc """
  Represents an Review resource in the IGDB API.
  """

  defstruct id: nil,
            username: nil,
            slug: nil,
            url: nil,
            title: nil,
            created_at: nil,
            updated_at: nil,
            game: nil,
            category: nil,
            likes: nil,
            views: nil,
            rating_category: nil,
            platform: nil,
            video: nil,
            introduction: nil,
            content: nil,
            conclusion: nil,
            positive_points: nil,
            negative_points: nil

  use Igdb.Resource

  def resource_collection_name, do: "reviews"
end
