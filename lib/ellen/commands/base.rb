module Ellen
  module Commands
    class Base
      attr_reader :options

      def initialize(options)
        @options = options
      end
    end
  end
end
