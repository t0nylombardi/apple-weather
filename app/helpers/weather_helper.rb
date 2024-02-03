# frozen_string_literal: true

module WeatherHelper
  def display_cached_text(forecast)
    return if forecast.instance_of?(String)

    '<p class="text-sm">Cached</p>'.html_safe if forecast[:cached]
  end
end
