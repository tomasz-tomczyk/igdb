defmodule Igdb.PlatformVersionCompany do
  @moduledoc """
  Represents a Platform Version Company resource in the IGDB API.
  """

  use Igdb.Resource

  def resource_collection_name(), do: "platform_version_companies"
end
