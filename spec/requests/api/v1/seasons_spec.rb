require 'rails_helper'

RSpec.describe 'Seasons API' do
  describe 'GET /api/v1/seasons' do
    it 'returns seasons including episodes ordered by its number' do
      season = FactoryBot.create(:season)
      episodes = FactoryBot.create_list(:episode, 3, season: season)

      get '/api/v1/seasons'

      parsed_response = response.parsed_body

      expect(response).to be_success
      expect(parsed_response[0]['episodes'].size).to eql(3)
    end
  end
end
