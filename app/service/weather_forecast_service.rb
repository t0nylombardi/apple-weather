# frozen_string_literal: true

class WeatherForecastService
  class Failure < StandardError; end
  require 'httparty'
  require 'json'

  API_BASE_URL = 'https://api.weatherapi.com/v1/forecast.json'
  API_KEY = Rails.application.credentials[:weather_api_key]
  CACHE_EXPIRY_TIME = 30.minutes

  def initialize(location:, ip_address: nil)
    @location = location
    @ip_address = ip_address
    @cache_key = "weather_forecast_#{@ip_address}"
    @cache_store = ActiveSupport::Cache::MemoryStore.new(expires_in: CACHE_EXPIRY_TIME)
  end

  def forecast
    return unless @location

    cached_data = @cache_store.read(@cache_key)

    return cached_data if cached_data

    data = fetch_data_from_api
    @cache_store.write(@cache_key, data)

    data.merge(cached: true)
  end

  private

  def fetch_data_from_api
    response = api_request

    response.success? ? successful_response(response) : failed_response(response)
  end

  def params
    {
      key: API_KEY,
      q: @location,
      days: 5,
      aqi: 'no',
      alerts: 'no',
      hour: 24
    }
  end

  def api_request
    HTTParty.get(API_BASE_URL, query: params)
  end

  def successful_response(response)
    cache_forecast(response.body)
    parse_response(response.body)
  end

  def failed_response(response)
    handle_error(response)
    raise Failure, 'Failed to fetch weather data'
  end

  def parse_response(response_body)
    data = JSON.parse(response_body)
    data['forecast']
  end

  def cache_forecast(data)
    @cache_store.write(@cache_key, data)
  end

  def handle_error(response)
    Rails.logger.error("Error: #{response.code} - #{response.message}")
  end
end
