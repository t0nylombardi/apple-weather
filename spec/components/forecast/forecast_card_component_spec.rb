# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Forecast::ForecastCardComponent, type: :component do

  it 'renders the forecast card with the correct content' do
    date = Time.zone.today
    current = 20
    high = 25
    low = 15
    description = 'Sunny'
    image = 'sunny.png'

    render_inline(described_class.new(date:, current:, high:, low:, description:, image:))

    expect(page).to have_css 'p', text: 'Sunny'
    expect(page).to have_text("#{current}°")
    expect(page).to have_text("#{high}°")
    expect(page).to have_text("#{low}°")
    expect(page).to have_text(description)
    expect(page).to have_css("img[src*='#{image}']")
  end
end
