# IGDB
[![Actions Status](https://github.com/tomasz-tomczyk/igdb/workflows/Build/badge.svg)](https://github.com/tomasz-tomczyk/igdb/actions)
[![Docs](https://img.shields.io/badge/docs-hex.pm-brightgreen)](https://hexdocs.pm/igdb/Igdb.html)

## Installation

The package can be installed by adding `igdb` to your list of dependencies in
`mix.exs`:

```elixir
def deps do
  [
    {:igdb, "~> 1.0.1"}
  ]
end
```

Documentation can be found at [https://hexdocs.pm/igdb](https://hexdocs.pm/igdb).

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
export IGDB_API_ROOT="https://api-v3.igdb.com"
```

Then, just be sure to run `source .env` in your shell before compiling your
project.

## Usage

### Search

Returns a list of resources found from given search options.

If the resources could not be loaded, `search/1` will return a 3-element tuple
in this format, `{:error, message, code}`. The `code` is the HTTP status code
returned by the IGDB API, for example, 404.

#### Options

The options should be passed as a keyword list. Below is a list of allowed keys:

| Option   | Values                                                                     | Example                                              |
|----------|----------------------------------------------------------------------------|------------------------------------------------------|
| `fields` | atom, string or list of those; can be nested with periods                  | `"*", ["*", "game.*]`                                |
| `sort`   | string; column with the direction (asc/desc); cannot be used with `search` | `"created_at desc"`                                  |
| `limit`  | integer                                                                    | `10`                                                 |
| `search` | string; text you want to search for; cannot be used with `sort`            | `"Final Fantasy"`                                    |
| `where`  | list of strings, will be joined with AND - you may construct your own      | `["platforms = 48", "date > 1538129354"]`            |
| `exclude`| string; exclude irrelevant data from your query                            | `"tags"`                                             |

Refer to individual resources for the available columns to filter on.

#### Examples

```
iex> Igdb.Game.search(search: "Final Fantasy", limit: 5, where: ["platforms = 48"], fields: "name")
{:ok,
[
  %{id: 37087, name: "Monster of the Deep: Final Fantasy XV"},
  %{id: 11169, name: "Final Fantasy VII Remake"},
  %{id: 36831, name: "Dissidia Final Fantasy NT"},
  %{id: 38492, name: "Final Fantasy XV Deluxe Edition"},
  %{id: 26069, name: "FINAL FANTASY XV - Season Pass Upgrade"}
]}
```

## Testing

Unit tests:

```
mix test
```

There is an external test, not run by default, that hits the API for each
resource endpoint. To enable, it, first ensure you have the API configured in
the ENV:

```
export IGDB_TEST_API_KEY="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
export IGDB_TEST_API_ROOT="https://api-v3.igdb.com"
```

And run:

```
mix test --include external
```

## Credits

A lot of inspiration taken from [ex_twilio](https://github.com/danielberkompas/ex_twilio). Thank you!