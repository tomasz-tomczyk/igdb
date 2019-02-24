defmodule Igdb.Company do
  @moduledoc """
  Represents a Company resource in the IGDB API.
  """

  use Igdb.Resource

  def resource_collection_name(), do: "companies"
end
