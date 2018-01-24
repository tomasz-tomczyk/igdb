defmodule Igdb.Resource do
  @moduledoc """
  Representation of resource inside the API
  """

  defmacro __using__(_options) do
    quote do
      alias Igdb.Api

      @spec find(integer) :: {:ok, list} | {:error, String.t()}
      def find(id), do: Api.find(__MODULE__, id)
    end
  end
end
