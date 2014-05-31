# Abstract class to be inherited from adapter class.
module Ruboty
  module Adapters
    class Base
      include Env::Validatable

      class << self
        def inherited(child_class)
          Ruboty::AdapterBuilder.adapter_classes << child_class
        end
      end

      attr_reader :robot

      def initialize(robot)
        @robot = robot
        validate
      end
    end
  end
end
