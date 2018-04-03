defmodule Igdb.ExternalReviewSource do
  @moduledoc """
  Represents an External Review Source resource in the IGDB API.
  """

  defstruct id: nil,
            game: nil,
            source: nil,
            url: nil,
            score: nil

  use Igdb.Resource

  def resource_collection_name, do: "external_review_source"
end
