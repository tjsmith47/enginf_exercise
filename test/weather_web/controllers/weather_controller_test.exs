defmodule WeatherWeb.WeatherControllerTest do
  use WeatherWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert json_response(conn, 200) == %{"foo" => "bar"}
  end

  test "GET /weather", %{conn: conn} do
    conn = get(conn, "/weather")
    assert json_response(conn, 200) == %{"data" => "data"}
  end
end
