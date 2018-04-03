defmodule Igdb.Pulse do
  @moduledoc """
  Represents an Pulse resource in the IGDB API.
  """

  defstruct id: nil,
            pulse_source: nil,
            title: nil,
            summary: nil,
            url: nil,
            uid: nil,
            created_at: nil,
            updated_at: nil,
            published_at: nil,
            image: nil,
            author: nil,
            tags: nil

  use Igdb.Resource

  def resource_collection_name, do: "pulses"
end
