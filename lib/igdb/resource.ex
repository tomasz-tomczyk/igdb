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

      @spec search(map) :: {:ok, list} | {:error, String.t()}
      def search(options \\ %{}), do: Api.search(__MODULE__, options)
    end
  end
end
