require 'rails_helper'

RSpec.describe 'Movies API', type: :request do
  describe 'GET /api/v1/movies' do
    it 'retuns the movies ordered by creation DESC' do
      movie = FactoryBot.create_list(:movie, 3)

      get '/api/v1/movies'

      parsed_response = response.parsed_body

      expect(response).to be_success
      expect(parsed_response.size).to eql(3)
    end
  end
end
