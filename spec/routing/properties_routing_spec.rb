require 'rails_helper'

RSpec.describe PropertiesController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/properties').to route_to('properties#create')
    end
  end
end
