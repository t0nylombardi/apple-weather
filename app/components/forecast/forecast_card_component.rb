# frozen_string_literal: true

class Forecast::ForecastCardComponent < ViewComponent::Base
  def initialize(date:, current:, high:, low:, description:, image:)
    super
    @date = date.to_date
    @current = current
    @high = high
    @low = low
    @description = description
    @image = image
  end
end
