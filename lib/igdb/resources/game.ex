defmodule Igdb.Game do
  @moduledoc """
  Represents an Game resource in the IGDB API.
  """

  defstruct id: nil,
            name: nil,
            slug: nil,
            summary: nil

  alias Igdb.Config

  @doc ~S"""
  Finds a single game by id.

  ## Examples

    Igdb.Game.find(359)
    [%Igdb.Game{id: 359, name: "Final Fantasy XV", slug: "final-fantasy-xv", summary: "Final Fantasy XV is an action role-playing video game..."}]

  """
  def find(game_id) do
    case HTTPoison.get("#{Config.api_root()}/games/#{game_id}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Poison.decode!(as: [%Igdb.Game{}])
        |> List.first()

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        "Not found :("

      {:error, %HTTPoison.Error{reason: reason}} ->
        reason
    end
  end
end
