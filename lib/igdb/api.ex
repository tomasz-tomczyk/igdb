defmodule Igdb.Api do
  @moduledoc """
  Provides a basic HTTP interface to allow easy communication with the IGDB
  API, by wrapping `HTTPoison`.
  """

  alias Igdb.Url

  @doc ~S"""
  Finds a single resource by id.

  ## Examples

      Igdb.Game.find(359)
      [%Igdb.Game{id: 359, name: "Final Fantasy XV", slug: "final-fantasy-xv", summary: "Final Fantasy XV is an action role-playing video game..."}]

  """
  @spec find(module, integer, list) :: {:ok, term} | {:error, String.t()}
  def find(module, resource_id, options) do
    module
    |> Url.generate_url(options, resource_id)
    |> request(module)
  end

  @spec get(module, list) :: {:ok, term} | {:error, String.t()}
  def get(module, options) do
    module
    |> Url.generate_url(options)
    |> request(module)
  end

  def request(url, module) do
    url
    |> HTTPoison.get!(Url.auth_headers())
    |> parse(module)
  end

  defp parse(response, module) do
    handle_errors(response, fn body ->
      Poison.decode!(body, as: [module.__struct__])
    end)
  end

  # defp parse(body, :resource, module) do
  #   Poison.decode!(body, as: module.__struct__)
  # end

  # defp parse(body, :collection, module) do
  #   Poison.decode!(body, as: [module.__struct__])
  # end

  defp handle_errors(response, fun) do
    case response do
      %{body: body, status_code: status} when status in [200, 201] ->
        {:ok, fun.(body)}

      %{body: _, status_code: 204} ->
        :ok

      %{body: _, status_code: 403} ->
        {:error, "Authentication parameters missing"}

      %{body: body, status_code: status} ->
        {:ok, json} = Poison.decode(body)
        {:error, json["message"], status}
    end
  end
end
