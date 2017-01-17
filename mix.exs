defmodule Botan.Mixfile do
  use Mix.Project

  def project do
    [app: :botan,
     version: "0.1.2",
     elixir: "~> 1.2",
     description: "Elixir wrapper for Botan.io",
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:httpoison, "~> 0.9.0"},
     {:poison, "~> 3.0"},
     {:exvcr, "~> 0.7", only: :test},
     {:earmark, "~> 0.1", only: :dev},
     {:ex_doc, "~> 0.11", only: :dev}]
  end

  defp package do
    [maintainers: ["Timur Yanberdin"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/mendab1e/exBotan",
              "Docs" => "http://hexdocs.pm/botan"}]
  end
end
