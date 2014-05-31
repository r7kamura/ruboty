module Ruboty
  module Actions
    class Base
      attr_reader :message

      def initialize(message)
        @message = message
      end
    end
  end
end
