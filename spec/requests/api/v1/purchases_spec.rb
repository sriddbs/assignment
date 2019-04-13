require 'rails_helper'

RSpec.describe 'Purchase API', type: :request do
  describe 'POST /api/v1/purchases' do
    let(:user) { FactoryBot.create(:user) }
    let(:movie) { FactoryBot.create(:movie) }
    let(:season) { FactoryBot.create(:season) }

    context 'when user is not found' do
      params = { purchase: { user_id: 100 } }
      it 'returns error message' do
        post '/api/v1/purchases', params: params

        expect(response.status).to eql(404)
        expect(response.parsed_body).to eql({"message"=>"Couldn't find User with 'id'=100"})
      end
    end

    context 'when user is present' do
      context 'when no active content present' do
        it 'allows user to purchase a content' do
          params = { purchase: { user_id: user.id, movies: [{ id: movie.id, price: 2.99, video_quality: 'SD' }] } }

          post '/api/v1/purchases', params: params
          parsed_response = response.parsed_body
          purchase = user.purchases.last
          libraries = user.libraries

          expect(response).to be_success
          expect(parsed_response['validity_starts_on']).to eql(purchase.validity_starts_on.to_s(:db))
          expect(parsed_response['validity_expires_on']).to eql(purchase.validity_expires_on.to_s(:db))
          expect(parsed_response['purchase_line_items'].count).to eql(1)
          expect(libraries.count).to eql(1)
          expect(libraries.active.count).to eql(1)
          expect(libraries.first.movies.count).to eql(1)
        end
      end

      context 'when user tries to purchase same content' do
        context 'when content is active' do
          it 'does not allow purchase and returns error message' do
            library = FactoryBot.create(:library, user: user, validity_starts_on: Date.today,
              validity_expires_on: Date.today + Purchase::EXPIRE_DAYS)

            library_contents = FactoryBot.create(:library_content, library: library, content: season)
            params = { purchase: { user_id: user.id, seasons: [{ id: season.id, price: 2.99, video_quality: 'SD' }] } }

            expect { post '/api/v1/purchases', params: params }.to_not change { user.libraries.count }

            parsed_response = response.parsed_body

            expect(parsed_response).to eql({"errors"=>"Some of the contents you selected is already purchased and still active"})
          end
        end

        context 'when content is expired' do
          it 'allows to purchase the content' do
            library = FactoryBot.create(:library, user: user, validity_starts_on: Date.today,
              validity_expires_on: Date.today + Purchase::EXPIRE_DAYS )

            library_contents = FactoryBot.create(:library_content, library: library, content: season)
            params = { purchase: { user_id: user.id, seasons: [{ id: season.id, price: 2.99, video_quality: 'SD' }] } }

            Timecop.travel(4.days)
            expect { post '/api/v1/purchases', params: params }.to change { user.libraries.count }.by(1)
          end
        end
      end
    end
  end
end
