defmodule Igdb.Game do
  @moduledoc """
  Represents an Game resource in the IGDB API.
  """

  defstruct id: nil,
            name: nil,
            slug: nil,
            summary: nil

  use Igdb.Resource

  def resource_name, do: "game"
  def resource_collection_name, do: "games"
end
