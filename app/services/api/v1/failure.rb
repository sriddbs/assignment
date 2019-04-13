module Api
  module V1
    class Failure < StandardError
      attr_reader :context

      def initialize(context=nil)
        @context = context
        super
      end
    end
  end
end
