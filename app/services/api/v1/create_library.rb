module Api
  module V1
    class CreateLibrary
      def initialize(purchase, user)
        @purchase = purchase
        @user = user
      end

      def call
        create_library
        create_library_contents
      end

      private

      def create_library
        @library = @user.libraries.create!(
          validity_starts_on: @purchase.validity_starts_on,
          validity_expires_on: @purchase.validity_expires_on
        )
      end

      def create_library_contents
        @purchase.purchase_line_items.each do |line_item|
          @library.library_contents.create!(
            content_id: line_item.content_id,
            content_type: line_item.content_type,
            library_id: @library.id
          )
        end
      end
    end
  end
end
