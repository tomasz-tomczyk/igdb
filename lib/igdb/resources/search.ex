defmodule Igdb.Search do
  @moduledoc """
  Represents a Search resource in the IGDB API.
  """

  use Igdb.Resource

  def resource_collection_name(), do: "search"
end
