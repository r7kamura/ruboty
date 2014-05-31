module Ruboty
  module Brains
    class Memory < Base
      def data
        @data ||= {}
      end
    end
  end
end
