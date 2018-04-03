defmodule Igdb.PulseGroup do
  @moduledoc """
  Represents an Pulse Group resource in the IGDB API.
  """

  defstruct id: nil,
            name: nil,
            category: nil,
            created_at: nil,
            updated_at: nil,
            published_at: nil,
            tags: nil,
            pulses: nil,
            game: nil

  use Igdb.Resource

  def resource_collection_name, do: "pulse_groups"
end
