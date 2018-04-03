defmodule Igdb.ExternalReview do
  @moduledoc """
  Represents an External Reviews resource in the IGDB API.
  """

  defstruct id: nil,
            game: nil,
            source: nil,
            url: nil,
            score: nil

  use Igdb.Resource

  def resource_collection_name, do: "external_reviews"
end
