# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Forecast::FormComponent, type: :component do
  it 'renders the form with the correct attributes' do
    render_inline(described_class.new)

    expect(page).to have_css('form', count: 1)
    expect(page).to have_css('form[class="mt-8"]')

    expect(page).to have_css('label[for="search"]', text: 'Enter your address')
    expect(page).to have_css('input[type="text"][id="location"][placeholder="Enter your address"][required]')
    expect(page).to have_field('postal_code', type: 'hidden')
  end
end
