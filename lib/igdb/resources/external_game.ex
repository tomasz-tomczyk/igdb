defmodule Igdb.ExternalGame do
  @moduledoc """
  Represents a External Game resource in the IGDB API.
  """

  use Igdb.Resource

  def pro_tier(), do: true
end
