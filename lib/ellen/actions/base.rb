module Ellen
  module Actions
    class Base
      attr_reader :options

      def initialize(options)
        @options = options
      end

      private

      def robot
        options[:robot]
      end

      def message
        options[:message]
      end
    end
  end
end
