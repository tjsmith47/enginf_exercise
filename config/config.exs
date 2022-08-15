# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :weather,
  ecto_repos: [Weather.Repo],
  env: :dev

# Configures the endpoint for chosen API;
# --> OpenWeatherMap chosen due to offering a free weather API.
config :weather, WeatherWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: SECRET_KEY_BASE,
  owm_api_base: OWM_API_KEY,
  render_errors: [view: WeatherWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Weather.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
