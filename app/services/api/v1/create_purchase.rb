module Api
  module V1
    class CreatePurchase < Base
      def initialize(user, purchase_params)
        @user = user
        @params = purchase_params
      end

      def call
        ActiveRecord::Base.transaction do
          validate_params
          if user_can_purchase?
            create_purchase
            create_purchase_line_items
            create_library
            success("Purchase created successfully", @purchase)
          else
            failure("Some of the contents you selected is already purchased and still active")
          end
        end
      end

      private

      def validate_params
        failure('Either movies or seasons should be present') if @params[:movies].blank? && @params[:seasons].blank?
      end

      def user_can_purchase?
        ValidatePurchase.new(@user, @params).call
      end

      def create_purchase
        @purchase = @user.purchases.build
        set_purchase_validity
        calculate_total_price
        @purchase.save!
      end

      def set_purchase_validity
        @purchase.validity_starts_on = Date.today
        @purchase.validity_expires_on = @purchase.validity_starts_on + Purchase::EXPIRE_DAYS
      end

      def calculate_total_price
        total_price = 0

        if @params[:movies]
          @params[:movies].each do |movie|
            total_price += movie[:price].to_i
          end
        end

        if @params[:seasons]
          @params[:seasons].each do |season|
            total_price += season[:price].to_i
          end
        end

        @purchase.price = total_price
      end

      def create_purchase_line_items
        CreatePurchaseLineItem.new(@purchase, @params).call
      end

      def create_library
        CreateLibrary.new(@purchase, @user).call
      end
    end
  end
end
