defmodule Igdb.Api do
  @moduledoc """
  Provides a basic HTTP interface to allow easy communication with the IGDB
  API, by wrapping `HTTPoison`.
  """

  alias Igdb.Config

  def request(path, type, module) do
    path
    |> generate_url()
    |> HTTPoison.get!()
    |> handle_errors(fn body ->
      parse(body, type, module)
    end)
  end

  defp parse(body, :resource, module) do
    Poison.decode!(body, as: module.__struct__)
  end

  defp parse(body, :collection, module) do
    Poison.decode!(body, as: [module.__struct__])
  end

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

  defp generate_url(path) do
    "#{Config.api_root()}/#{path}"
  end
end
