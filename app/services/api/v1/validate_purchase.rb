module Api
  module V1
    class ValidatePurchase < Base
      def initialize(user, params)
        @user = user
        @params = params
      end

      def call
        conflicting_movies.blank? && conflicting_seasons.blank?
      end

      private

      def conflicting_movies
        @user.active_contents.where(content_id: @params[:movies].collect { |m| m[:id] }, content_type: 'Movie') if @params[:movies].present?
      end

      def conflicting_seasons
        @user.active_contents.where(content_id: @params[:seasons].collect { |s| s[:id] }, content_type: 'Season') if @params[:seasons].present?
      end
    end
  end
end
