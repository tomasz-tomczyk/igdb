defmodule Igdb.InvolvedCompany do
  @moduledoc """
  Represents a Involved Company resource in the IGDB API.
  """

  use Igdb.Resource

  def resource_collection_name(), do: "involved_companies"
end
