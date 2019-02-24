defmodule Igdb.Resource do
  @moduledoc """
  Representation of resource inside the API
  """

  defmacro __using__(_options) do
    quote do
      alias Igdb.Api

      @spec search(list) :: {:ok, list} | {:error, String.t()}
      def search(options \\ []), do: Api.search(__MODULE__, options)
    end
  end
end
