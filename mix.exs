defmodule Artscii.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),

      # Docs
      name: "Artscii",
      source_url: "https://github.com/kelvinst/artscii_umbrella",
      docs: [
        main: "readme",
        logo: "priv/static/images/logo.png",
        extras: ["README.md"]
      ]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.22", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      setup: ["cmd mix setup"]
    ]
  end
end
