defmodule Igdb.Options do
  @moduledoc """
  Builds strings from the options list
  """

  def build([]), do: ""

  def build(options) do
    options
    |> Enum.map(&build_option/1)
    |> Enum.join("; ")
    |> Kernel.<>(";")
  end

  defp build_option({:fields, values}) when is_list(values) do
    "fields #{Enum.join(values, ", ")}"
  end

  defp build_option({:fields, val}) do
    "fields #{val}"
  end

  defp build_option({:search, val}) do
    "search \"#{val}\""
  end

  defp build_option({:exclude, val}) do
    "exclude #{val}"
  end

  defp build_option({:sort, val}) do
    "sort #{val}"
  end

  defp build_option({:limit, limit}), do: "limit #{limit}"

  defp build_option({:where, values}) when is_list(values) do
    "where #{Enum.join(values, " & ")}"
  end
end
