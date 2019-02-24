defmodule Igdb.Options do
  @moduledoc """
  Builds strings from the options list
  """

  def build([]), do: ""

  def build(options) do
    options
    |> Enum.map(&Igdb.Options.build_option/1)
    |> Enum.join(";")
    |> Kernel.<>(";")
  end

  def build_option({:fields, values}) when is_list(values) do
    "fields #{Enum.join(values, " ")}"
  end

  def build_option({:fields, val}) do
    "fields #{val}"
  end
end
