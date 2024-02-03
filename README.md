# Weather Forecast Service

## Overview

The Weather Forecast Service is a Ruby class designed to interact with a
weather forecasting API and provide weather forecast data for a given location.
It incorporates caching to improve performance and reduce unnecessary API calls.

## Dependencies
- Ruby (>= 2.5.0)
- Rails (>= 5.2.0)
- ActiveSupport (>= 5.2.0)
- HTTParty gem (>= 0.18.0)

## Installation
1. Clone the repository to your local machine.
2. Set up your Rails application with the required dependencies.
3. Place `master.key` inside the `config` directory
4. Start the rails server `bin/dev`

## Configuration

- `API_BASE_URL`: The base URL of the weather forecasting API.
- `API_KEY`: Your API key for accessing the weather forecasting API.
- `CACHE_EXPIRY_TIME`: The duration for which the forecast data is cached (e.g., 30 minutes).

## Forecast Controller Overview

The `ForecastController` handles requests related to weather forecasts in a Rails application.
It interacts with the WeatherForecastService to fetch and display forecast data.