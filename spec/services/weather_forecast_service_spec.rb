require 'rails_helper'

RSpec.describe WeatherForecastService do
  describe '#forecast' do
    let(:location) { 'City, Country' }
    let(:postal_code) { '12345' }
    let(:service) { described_class.new(location:, postal_code:) }

    context 'when the location is provided' do
      context 'when data is cached' do
        it 'returns cached data' do
          allow(Rails.cache).to receive(:read).with("weather_forecast_#{postal_code}").and_return({ 'cached' => true })

          expect(service.forecast).to eq({ 'cached' => true })
        end
      end

      context 'when data is not cached' do
        it 'fetches data from the API' do
          allow(service).to receive(:fetch_data_from_api)

          service.forecast

          expect(service).to have_received(:fetch_data_from_api)
        end
      end
    end

    context 'when the location is not provided' do
      it 'returns nil' do
        service = described_class.new(location: nil)

        expect(service.forecast).to be_nil
      end
    end
  end

  describe '#fetch_data_from_api' do
    let(:location) { 'City, Country' }
    let(:postal_code) { '12345' }
    let(:service) { described_class.new(location:, postal_code:) }

    context 'when the API request is successful' do
      let(:forecast_service_valid) do
        instance_double(HTTParty::Response, success?: true, body: '{"forecast":{"forecastday": "some data"}}')
      end

      it 'returns parsed response data' do
        allow(service).to receive(:api_request).and_return(forecast_service_valid)

        expect(service.send(:fetch_data_from_api)).to eq({ 'forecast' => { 'forecastday' => 'some data' } })
      end
    end

    context 'when the API request fails' do
      let(:forecast_service_invalid) do
        instance_double(HTTParty::Response, success?: false, code: 400, body: '{"error": {"message": "some error"}}')
      end

      it 'calls handle_error method' do
        allow(service).to receive(:api_request).and_return(forecast_service_invalid)

        expect(service.send(:fetch_data_from_api)).to eq({ 'error' => { 'message' => 'some error' } })
      end
    end
  end

  # Add more tests for other methods as needed
end
