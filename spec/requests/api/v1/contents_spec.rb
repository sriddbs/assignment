require 'rails_helper'

RSpec.describe 'Contents API', type: :request do
  describe 'GET /api/v1/contents' do
    it 'returns movies and episodes' do
      FactoryBot.create_list(:movie, 3)
      FactoryBot.create_list(:season, 3)

      get '/api/v1/contents'

      parsed_response = response.parsed_body

      expect(response).to be_success
      expect(parsed_response['movies'].size).to eql(3)
      expect(parsed_response['seasons'].size).to eql(3)
    end
  end
end
