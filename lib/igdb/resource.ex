defmodule Igdb.Resource do
  @moduledoc """
  Representation of resource inside the API
  """

  defmacro __using__(_options) do
    quote do
      alias Igdb.Api

      @spec find(integer, list) :: {:ok, list} | {:error, String.t()}
      def find(id, options \\ []), do: Api.find(__MODULE__, id, options)

      @spec get(list) :: {:ok, list} | {:error, String.t()}
      def get(options \\ []), do: Api.get(__MODULE__, options)
    end
  end
end
