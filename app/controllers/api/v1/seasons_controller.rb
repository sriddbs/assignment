class Api::V1::SeasonsController < ApplicationController
  def index
    seasons = Season.order('created_at')

    json_response seasons
  end
end
