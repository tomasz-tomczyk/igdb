defmodule Igdb.Url do
  @moduledoc """
  Generates IGDB URLs.
  """

  alias Igdb.Config

  def generate_url(module, options, resource_id \\ nil) do
    "#{Config.api_root()}/#{module.resource_collection_name}/#{resource_id}" <>
      build_query(options)
  end

  def auth_headers do
    ["user-key": Config.api_key(), Accept: "Application/json; Charset=utf-8"]
  end

  defp build_query(options) do
    query =
      options
      |> to_query

    if String.length(query) > 0, do: "?" <> query, else: ""
  end

  def to_query(input, namespace) do
    input
    |> Enum.map(fn {key, value} -> parse_query("#{namespace}[#{key}]", value) end)
    |> Enum.join("&")
  end

  def to_query(input) do
    input
    |> Enum.map(fn {key, value} -> parse_query(key, value) end)
    |> Enum.join("&")
  end

  def parse_query(key, value) when is_map(value) do
    to_query(value, key)
  end

  def parse_query(key, value), do: "#{key}=#{value}"
end
