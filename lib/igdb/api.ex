defmodule Igdb.Api do
  @moduledoc """
  Provides a basic HTTP interface to allow easy communication with the IGDB
  API, by wrapping `HTTPoison`.
  """

  alias Igdb.Url

  @spec get(module, integer, map) :: {:ok, term} | {:error, String.t()}
  def get(module, resource_id, options) when is_integer(resource_id) do
    module
    |> Url.generate_url(options, resource_id)
    |> request(module, :resource)
  end

  @spec get(module, list, map) :: {:ok, term} | {:error, String.t()}
  def get(module, resource_ids, options) when is_list(resource_ids) do
    module
    |> Url.generate_url(options, resource_ids |> Enum.join(","))
    |> request(module, :collection)
  end

  @doc ~S"""
  Search a resource using filters.

  ## Examples

      Igdb.Game.search(%{search: "Final Fantasy", limit: 1, fields: "id,name", filter: %{version_parent: %{not_exists: 1}}, order: "popularity:desc"})
      {:ok, [%{id: 11214, name: "World of Final Fantasy"}]}

  """
  @spec search(module, map) :: {:ok, term} | {:error, String.t()}
  def search(module, options) do
    module
    |> Url.generate_url(options)
    |> request(module, :collection)
  end

  defp request(url, module, type) do
    url
    |> HTTPoison.get!(Url.auth_headers())
    |> parse(module, type)
  end

  defp parse(response, module, :collection) do
    handle_errors(response, fn body ->
      body
      |> Poison.decode!(as: [module.__struct__])
    end)
  end

  defp parse(response, module, :resource) do
    handle_errors(response, fn body ->
      body
      |> Poison.decode!(as: [module.__struct__])
      |> List.first()
    end)
  end

  defp handle_errors(response, fun) do
    case response do
      %{body: body, status_code: status} when status in [200, 201] ->
        {:ok, fun.(body)}

      %{body: _, status_code: 204} ->
        :ok

      %{body: _, status_code: 403} ->
        {:error, "Authentication parameters missing", 403}

      %{body: body, status_code: status} ->
        {:ok, json} = Poison.decode(body)
        {:error, json["message"], status}
    end
  end
end
