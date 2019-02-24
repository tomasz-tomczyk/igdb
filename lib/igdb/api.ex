defmodule Igdb.Api do
  @moduledoc """
  Provides a basic HTTP interface to allow easy communication with the IGDB
  API, by wrapping `HTTPoison`.
  """

  def generate_url(module) do
    "#{Igdb.Config.api_root()}/#{module.resource_collection_name}"
  end

  def auth_headers do
    ["user-key": Igdb.Config.api_key(), Accept: "Application/json; Charset=utf-8"]
  end

  @doc ~S"""
  Search a resource using filters.
  """
  def search(module, options) do
    body = Igdb.Options.build(options)

    module
    |> generate_url()
    |> request(body)
  end

  defp request(url, body) do
    url
    |> HTTPoison.post!(body, auth_headers())
    |> parse()
  end

  defp parse(response) do
    handle_errors(response, fn body ->
      body
      |> Jason.decode!(keys: :atoms)
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
    end
  end
end
