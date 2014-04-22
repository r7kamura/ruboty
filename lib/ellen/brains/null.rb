module Ellen
  module Brains
    class Null < Base
      def data
        @data ||= {}
      end
    end
  end
end
