require 'rails_helper'

RSpec.describe 'Libraries API', type: :request do
  describe 'GET /api/v1/users/{user_id}/libraries' do
    context 'given a user' do
      it 'returns the library ordered by the remaining time to watch the content' do
        user = FactoryBot.create(:user)
        season = FactoryBot.create(:season)
        movie = FactoryBot.create(:movie)

        Timecop.travel(1.day.ago) do
          library = FactoryBot.create(:library, user: user, validity_starts_on: Date.today,
            validity_expires_on: Date.today + Purchase::EXPIRE_DAYS)

          FactoryBot.create(:library_content, library: library, content: movie)
        end

        library = FactoryBot.create(:library, user: user, validity_starts_on: Date.today,
          validity_expires_on: Date.today + Purchase::EXPIRE_DAYS)

        FactoryBot.create(:library_content, library: library, content: season)

        get "/api/v1/users/#{user.id}/libraries"

        parsed_response = response.parsed_body

        expect(response).to be_success
        expect(parsed_response.size).to eql(2)
      end
    end
  end
end
