module Api
  module V1
    class CreatePurchaseLineItem
      def initialize(purchase, purchase_params)
        @purchase = purchase
        @movies = purchase_params[:movies]
        @seasons = purchase_params[:seasons]
      end

      def call
        add_movies if @movies
        add_seasons if @seasons
      end

      private

      def add_movies
        @movies.each do |movie|
          @purchase.purchase_line_items.create!(
            content_id: movie[:id],
            content_type: 'Movie',
            video_quality: movie[:video_quality],
            price: movie[:price]
          )
        end
      end

      def add_seasons
        @seasons.each do |season|
          @purchase.purchase_line_items.create!(
            content_id: season[:id],
            content_type: 'Season',
            video_quality: season[:video_quality],
            price: season[:price]
          )
        end
      end
    end
  end
end
