require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  let(:attributes) do
    {
      x: 222,
      y: 444,
      title: 'Imóvel código 1, com 5 quartos e 4 banheiros',
      price: 1_250_000,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      beds: beds,
      baths: baths,
      square_meters: square_meters
    }
  end

  let(:beds) { 4 }
  let(:baths) { 3 }
  let(:square_meters) { 240 }

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Property' do
        expect {
          post :create, params: { property: attributes }, format: :json
        }.to change(Property, :count).by(1)
      end

      it 'renders a JSON response with the new property' do
        post :create, params: { property: attributes }, format: :json

        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(property_url(Property.last))
      end
    end

    context 'with invalid number of beds' do
      let(:beds) { 10 }

      it 'renders a JSON response with errors for the new property' do
        post :create, params: { property: attributes }, format: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end
end
