class Api::V1::MoviesController < ApplicationController
  def index
    movies = Movie.order('created_at DESC')

    json_response movies
  end
end
