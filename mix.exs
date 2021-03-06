defmodule StaticBlog.Mixfile do
  use Mix.Project

  def project do
    [app: :static_blog,
     version: "0.0.1",
     elixir: "~> 1.4",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {StaticBlog, []},
     applications: [:phoenix, :phoenix_html, :cowboy, :logger, :gettext,
                    :timex, :yamerl]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.2.1"},
     {:phoenix_html, "~> 2.9.2"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.13.1"},
     {:yamerl, "~> 0.4.0"},
     {:timex, "~> 3.1"},
     {:cowboy, "~> 1.0"},
     {:earmark, "~> 1.0.3"}]
  end
end
