defmodule Igdb.ProductFamily do
  @moduledoc """
  Represents a Product Family resource in the IGDB API.
  """

  use Igdb.Resource

  def resource_collection_name(), do: "product_families"
end
