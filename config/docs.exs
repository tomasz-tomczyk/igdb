use Mix.Config

config :igdb,
  api_key: {:system, "IGDB_TEST_API_KEY"},
  api_root: {:system, "IGDB_API_TEST_ROOT"}

config :logger, level: :info
