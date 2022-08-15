defmodule WeatherWeb.Router do
  use WeatherWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  #OpenWeatherMap API Routing Scope
  scope "/", WeatherWeb do
    pipe_through :api
    get "/weather", WeatherController, :get_weather
  end

  #Index landing route.
  scope "/", WeatherWeb do
    pipe_through :browser
    get "/", WeatherController, :index
  end
end
