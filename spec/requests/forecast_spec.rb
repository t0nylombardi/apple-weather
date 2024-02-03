# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Forecast' do
  describe 'GET /' do
    it 'renders the index template' do
      get root_path
      expect(response).to render_template(:index)
    end
  end

  describe 'POST /update_forecast' do
    let(:valid_params) { { location: '1 Infinite Loop, Cupertino, CA, USA', postal_code: '95014' } }
    let(:invalid_params) { { location: 'tttttt', postal_code: '' } }

    context 'with valid parameters' do
      it 'renders the weather_dashboard partial' do
        post update_forecast_path, params: valid_params
        expect(response).to render_template(partial: '_weather_dashboard')
      end
    end

    context 'when fetch_weather_data returns an error' do
      it 'sets a flash alert message' do
        post update_forecast_path, params: invalid_params
        expect(flash[:alert]).to eq('No matching location found.')
      end
    end
  end
end
