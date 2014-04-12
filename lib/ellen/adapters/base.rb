# Abstract class to be inherited from adapter class.
#
# Example:
#
#   class MyAdapter < Ellen::Adapters::Base
#     register :my_adapter # For `ellen --adapter=my_adapter`
#
#     def run
#       ... do your work ...
#     end
#   end
#
module Ellen
  module Adapters
    class Base
      def self.register(name)
        Ellen::AdapterBuilder.adapters[name.to_s] = self
      end

      attr_reader :robot, :options

      def initialize(robot, options)
        @robot = robot
        @options = options
      end
    end
  end
end
