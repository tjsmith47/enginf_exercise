defmodule WeatherWeb.WeatherController do
  use WeatherWeb, :controller

  #Test landing page definition.
  def index(conn, _params) do
    render(conn, "index.json", %{foo: "bar"})
  end

  # API JSON Response.
  def get_weather(conn, %{"latitude" => lat, "longitude" => lon}) do
    HTTPoison.start
    key = System.get_env("OWM_API_KEY")
    result = HTTPoison.get!("https://api.openweathermap.org/data/3.0/onecall?lat=#{lat}&lon=#{lon}&exclude=minutely,hourly,alerts&appid=#{key}&units=imperial")
    data = Jason.decode!(result.body)
    json(conn, data)
  end
end
