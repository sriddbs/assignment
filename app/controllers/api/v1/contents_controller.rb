class Api::V1::ContentsController < ApplicationController
  def index
    movies = Movie.order('created_at')
    seasons = Season.order('created_at')

    json_response({ movies: movies, seasons: seasons })
  end
end
