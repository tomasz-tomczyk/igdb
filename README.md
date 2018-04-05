# IGDB
[![Build Status](https://api.travis-ci.org/tomasz-tomczyk/igdb.svg?branch=master)](https://travis-ci.org/tomasz-tomczyk/igdb)
[![Coverage Status](https://coveralls.io/repos/github/tomasz-tomczyk/igdb/badge.svg?branch=master)](https://coveralls.io/github/tomasz-tomczyk/igdb?branch=master)
[![Inline docs](http://inch-ci.org/github/tomasz-tomczyk/igdb.svg)](http://inch-ci.org/github/tomasz-tomczyk/igdb)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `igdb` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:igdb, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/igdb](https://hexdocs.pm/igdb).

## Configuration

You will need to set the following configuration variables in your
`config/config.exs` file:

```elixir
use Mix.Config

config :igdb, api_key:  "IGDB_API_KEY",
              api_root: "IGDB_API_ROOT"
```

For security, I recommend that you use environment variables rather than hard
coding your account credentials. If you don't already have an environment
variable manager, you can create a `.env` file in your project with the
following content:

```bash
export IGDB_API_KEY="<production key here>"
export IGDB_API_ROOT="https://api-XXXXXXXXXX.apicast.io"
```

Then, just be sure to run `source .env` in your shell before compiling your
project.

## Usage

For most resources, you can get it by ID and get an individual object back or
search using filters.

### Get

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

### Search

Returns a list of resources found from given search options.

#### Options

The options should be passed as a map. Below is a list of allowed keys:

| Option   | Values                                                                     | Example                                              |
|----------|----------------------------------------------------------------------------|------------------------------------------------------|
| `fields` | string; comma separated, can be nested with periods                        | `"id,game.name"` `"*"`                               |
| `expand` | string; comma separated list of nested objects to expand                   | `"game"`                                             |
| `order`  | string; column with the direction (asc/desc)                               | `"created_at:desc"`                                  |
| `limit`  | integer                                                                    | `10`                                                 |
| `search` | string; text you want to search for                                        | `"Final Fantasy"`                                    |
| `filter` | nested list; for each column you can have comparison with `gt`, `lt`, `eq` | `%{date: %{gt: 1500619813000}, platform: %{eq: 48}}` |

Refer to individual resources for the available columns to filter on.

#### Examples

    Igdb.Game.search(%{search: "Final Fantasy", order: "popularity:desc", limit: 5, filter: %{platforms: %{eq: 48}}, fields: "*"})

## Credits

A lot of inspiration taken from [ex_twilio](https://github.com/danielberkompas/ex_twilio). Thank you!