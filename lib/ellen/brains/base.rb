module Ellen
  module Brains
    class Base
      class << self
        def inherited(child)
          brain_classes << child
        end

        def find_class
          brain_classes.last
        end

        private

        def brain_classes
          @brain_classes ||= []
        end
      end

      def data
        @data ||= {}
      end
    end
  end
end
