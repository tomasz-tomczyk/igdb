defmodule Igdb.Config do
  @moduledoc """
  Stores configuration variables used to communicate with IGDB's API.

  All settings also accept `{:system, "ENV_VAR_NAME"}` to read their
  values from environment variables at runtime.
  """

  @doc """
  Returns the IGDB API key. Set it in `mix.exs`:

      config :igdb, api_key: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  """
  def api_key, do: from_env(:igdb, :api_key)

  @doc """
  Returns the IGDB root path. Set it in `mix.exs`:

      config :igdb, api_root: "https://api-XXXXXXXXXX.apicast.io"
  """
  def api_root, do: from_env(:igdb, :api_root)

  @doc """
  A light wrapper around `Application.get_env/2`, providing automatic support for
  `{:system, "VAR"}` tuples.
  """
  def from_env(otp_app, key, default \\ nil)

  def from_env(otp_app, key, default) do
    otp_app
    |> Application.get_env(key, default)
    |> read_from_system(default)
  end

  defp read_from_system({:system, env}, default), do: System.get_env(env) || default
  defp read_from_system(value, _default), do: value
end
