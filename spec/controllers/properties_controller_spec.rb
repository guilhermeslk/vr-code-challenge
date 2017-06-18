require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  let(:attributes) do
    {
      x: x,
      y: y,
      title: Faker::Lorem.sentence,
      price:  Faker::Number.decimal(8),
      description: Faker::Lorem.paragraph,
      beds: beds,
      baths: baths,
      square_meters: square_meters
    }
  end

  let(:x) { Faker::Number.between(0, 1400) }
  let(:y) { Faker::Number.between(0, 1000) }
  let(:beds) { Faker::Number.between(1, 5) }
  let(:baths) { Faker::Number.between(1, 4) }
  let(:square_meters) { Faker::Number.between(20, 240) }

  describe 'POST #create' do
    subject { post :create, params: { property: attributes }, format: :json }

    context 'with valid params' do
      it 'creates a new Property' do
        expect { subject }.to change(Property, :count).by(1)
      end

      it 'renders a JSON response with the new property' do
        subject

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(property_url(Property.last))
      end
    end

    context 'with invalid number of beds' do
      let(:beds) { 10 }

      it 'renders a JSON response with errors for the new property' do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid Spotippos bounds' do
      let(:x) { 1401 }

      it 'renders a JSON response with out of bounders error' do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
        expect(JSON.parse(response.body)['errors']['base'].first)
          .to eq 'outside the borders of Spotippos'
      end
    end
  end
end
