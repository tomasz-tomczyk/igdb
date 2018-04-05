defmodule Igdb.Resource do
  @moduledoc """
  Representation of resource inside the API
  """

  defmacro __using__(_options) do
    quote do
      alias Igdb.Api

      @doc ~S"""
      Finds a single resource by id.

      ## Examples

      If the resource was found, `get/2` will return a two-element tuple in this
      format, `{:ok, item}`.

          Igdb.Game.get(359)
          {:ok, %Igdb.Game{ ... }}

      If the resource could not be found, `get/2` will return a 2-element tuple
      in this format, `{:ok, nil}`. The `code` is the HTTP status code
      returned by the IGDB API, for example, 404.

          Igdb.Game.get(100000000)
          {:ok, nil}

      If the resource could not be loaded, `get/2` will return a 3-element tuple
      in this format, `{:error, message, code}`. The `code` is the HTTP status code
      returned by the IGDB API, for example, 404.

      """
      @spec get(integer, map) :: {:ok, list} | {:error, String.t()}
      def get(id, options \\ %{}), do: Api.get(__MODULE__, id, options)

      @doc ~S"""
      Returns a list of resources found from given search options.

      ## Options

      The options should be passed as a map. Below is a list of allowed keys:

      | Option   | Values                                                                     | Example                                              |
      |----------|----------------------------------------------------------------------------|------------------------------------------------------|
      | `fields` | string; comma separated, can be nested with periods                        | `"id,game.name"` `"*"`                               |
      | `expand` | string; comma separated list of nested objects to expand                   | `"game"`                                             |
      | `order`  | string; column with the direction (asc/desc)                               | `"created_at:desc"`                                  |
      | `limit`  | integer                                                                    | `10`                                                 |
      | `search` | string; text you want to search for                                        | `"Final Fantasy"`                                    |
      | `filter` | nested list; for each column you can have comparison with `gt`, `lt`, `eq` | `%{date: %{gt: 1500619813000}, platform: %{eq: 48}}` |

      Refer to individual resources for the available columns to filter on.

      ## Examples

          Igdb.Game.search(%{search: "Final Fantasy", order: "popularity:desc", limit: 5, filter: %{platforms: %{eq: 48}}, fields: "*"})

      """
      @spec search(map) :: {:ok, list} | {:error, String.t()}
      def search(options \\ %{}), do: Api.search(__MODULE__, options)
    end
  end
end
