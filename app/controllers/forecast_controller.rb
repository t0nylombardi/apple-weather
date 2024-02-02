# frozen_string_literal: true

class ForecastController < ApplicationController
  def index; end

  def update_forecast
    forecast = fetch_weather_data(location)
    handle_failed_fetch(forecast)

    render_component(forecast)
  end

  private

  def render_component(forecast)
    render turbo_stream:
      turbo_stream.replace('forecast',
                           partial: 'weather_dashboard',
                           locals: { forecast: })
  end

  def location
    params[:location]
  end

  def fetch_weather_data(location)
    WeatherForecastService.new(location:).forecast
  end

  def handle_failed_fetch(forecast)
    flash.now[:alert] = 'Failed to fetch weather data' unless forecast
  end
end
