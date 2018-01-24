defmodule Igdb.Api do
  @moduledoc """
  Provides a basic HTTP interface to allow easy communication with the IGDB
  API, by wrapping `HTTPoison`.
  """

  alias Igdb.Config

  @doc ~S"""
  Finds a single resource by id.

  ## Examples

      Igdb.Game.find(359)
      [%Igdb.Game{id: 359, name: "Final Fantasy XV", slug: "final-fantasy-xv", summary: "Final Fantasy XV is an action role-playing video game..."}]

  """
  @spec find(module, integer) :: {:ok, term} | {:error, String.t()}
  def find(module, resource_id) do
    module
    |> generate_url(resource_id)
    |> request(module)
  end

  def request(url, module) do
    url
    |> HTTPoison.get!()
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

      %{body: body, status_code: status} ->
        {:ok, json} = Poison.decode(body)
        {:error, json["message"], status}
    end
  end

  defp generate_url(module, resource_id) do
    "#{Config.api_root()}/#{module.resource_collection_name}/#{resource_id}"
  end
end
