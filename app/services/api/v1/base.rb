module Api
  module V1
    class Base
      def failure(message, status=422, object=nil)
        context = OpenStruct.new(success: false, message: message, object: object)
        raise ::Api::V1::Failure, context
      end

      def success(message, object)
        OpenStruct.new(success: true, message: message, object: object)
      end
    end
  end
end
