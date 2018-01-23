defmodule Igdb.MixProject do
  use Mix.Project

  def project do
    [
      app: :igdb,
      description: "Elixir wrapper for the Internet Game Database API. https://www.igdb.com/",
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      docs: docs(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Tomasz Tomczyk"],
      licenses: ["MIT"],
      links: %{Github: "https://github.com/tomasz-tomczyk/igdb"}
    ]
  end

  def docs do
    [
      readme: "README.md",
      main: Igdb
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.0"},
      {:poison, "~> 3.1"},
      {:mock, "~> 0.3.0", only: :test},
      {:credo, "~> 0.9.0-rc1", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.8", only: :test},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false}
    ]
  end
end
