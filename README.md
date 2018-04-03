# IGDB
[![Build Status](https://api.travis-ci.org/tomasz-tomczyk/igdb.svg?branch=master)](https://travis-ci.org/tomasz-tomczyk/igdb)
[![Coverage Status](https://coveralls.io/repos/github/tomasz-tomczyk/igdb/badge.svg?branch=master)](https://coveralls.io/github/tomasz-tomczyk/igdb?branch=master)

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
