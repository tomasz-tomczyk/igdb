defmodule Igdb.ResourcesTest do
  use ExUnit.Case, async: true
  @moduletag :external

  test "search every resource" do
    File.ls!("lib/igdb/resources")
    |> Enum.map(&convert_to_module/1)
    |> Enum.map(fn module ->
      unless apply(module, :pro_tier, []) do
        search_result = apply(module, :search, [])
        assert {:ok, result} = search_result
        assert is_list(result)
        assert Kernel.length(result) > 0
      end
    end)
  end

  defp convert_to_module(filename) do
    module_name =
      filename
      |> String.split(".")
      |> List.first()
      |> Macro.camelize()

    ("Elixir.Igdb." <> module_name)
    |> String.to_existing_atom()
  end
end
