require 'rails_helper'

RSpec.describe 'Properties', type: :request do
  it 'creates a property' do
    headers = { 'ACCEPT' => 'application/json' }
    params = {
      property: {
        x: Faker::Number.between(0, 1400),
        y: Faker::Number.between(0, 1000),
        title: Faker::Lorem.sentence,
        price: Faker::Number.decimal(8),
        description: Faker::Lorem.paragraph,
        beds: Faker::Number.between(1, 5),
        baths: Faker::Number.between(1, 4),
        square_meters: Faker::Number.between(20, 240)
      }
    }

    post '/properties', params: params, headers: headers

    expect(response.content_type).to eq('application/json')
    expect(response).to have_http_status(:created)
  end
end
