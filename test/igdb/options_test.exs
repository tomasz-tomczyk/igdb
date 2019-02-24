defmodule Igdb.OptionsTest do
  use ExUnit.Case, async: true

  test "fields option is generated" do
    assert Igdb.Options.build(fields: :name) == "fields name;"
    assert Igdb.Options.build(fields: [:name]) == "fields name;"
    assert Igdb.Options.build(fields: [:id, :name]) == "fields id, name;"
  end

  test "limit option is generated" do
    assert Igdb.Options.build(limit: 10) == "limit 10;"
  end

  test "where option is generated" do
    assert Igdb.Options.build(where: ["id = 1942"]) == "where id = 1942;"
    assert Igdb.Options.build(where: ["id = (8,9,11)"]) == "where id = (8,9,11);"
  end

  test "exclude option is generated" do
    assert Igdb.Options.build(exclude: "tags") == "exclude tags;"
  end

  test "sort option is generated" do
    assert Igdb.Options.build(sort: "date asc") == "sort date asc;"
  end

  test "search option is generated" do
    assert Igdb.Options.build(search: "Halo") == "search \"Halo\";"
  end

  test "combination of options is generated" do
    assert Igdb.Options.build(fields: "*", exclude: "tags") == "fields *; exclude tags;"

    assert Igdb.Options.build(
             fields: "*",
             where: ["platform = 48", "date > 1538129354"],
             sort: "date asc"
           ) == "fields *; where platform = 48 & date > 1538129354; sort date asc;"

    assert Igdb.Options.build(
             fields: [:name, :involved_companies],
             search: "Assassins Creed",
             where: ["version_parent = null"]
           ) ==
             "fields name, involved_companies; search \"Assassins Creed\"; where version_parent = null;"
  end
end
