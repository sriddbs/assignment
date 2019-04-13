class Api::V1::LibrariesController < ApplicationController
  def index
    user = User.find(params[:user_id])

    json_response(user.libraries.active.order_by_remaining_days)
  end
end
