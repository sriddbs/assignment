module Api
  module V1
    class PurchasesController < ApplicationController
      def create
        user = User.find(params[:purchase][:user_id])

        begin
          result = ::Api::V1::CreatePurchase.new(user, params[:purchase]).call
          json_response(result.object)
        rescue Failure => e
          json_response({ errors: e.context.message })
        end
      end
    end
  end
end
