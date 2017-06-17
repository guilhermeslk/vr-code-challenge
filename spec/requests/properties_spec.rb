require 'rails_helper'

RSpec.describe 'Properties', type: :request do
  it 'creates a property' do
    headers = { 'ACCEPT' => 'application/json' }
    params = {
      property: {
        x: 222,
        y: 444,
        title: 'Imóvel código 1, com 5 quartos e 4 banheiros',
        price: 1_250_000,
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        beds: 4,
        baths: 3,
        square_meters: 240
      }
    }

    post '/properties', params: params, headers: headers

    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(:created)
  end
end
