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
      package: package()
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

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.0"}
    ]
  end
end
