# frozen_string_literal: true

class Forecast::ForecastCardComponent < ViewComponent::Base
  def initialize(date:, high:, low:, description:, image:)
    super
    @date = date.to_date
    @high = high
    @low = low
    @description = description
    @image = image
  end
end
