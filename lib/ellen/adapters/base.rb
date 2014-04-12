# Abstract class to be inherited from adapter class.
#
# Example:
#
#   # Used as `ellen --adapter=my_adapter`
#   class MyAdapter < Ellen::Adapters::Base
#     def run
#       ... do your work ...
#     end
#   end
#
module Ellen
  module Adapters
    class Base
      class << self
        def inherited(child)
          Ellen.adapters[child.name.split("::").last.underscore] = child
        end
      end

      attr_reader :robot, :options

      def initialize(robot, options)
        @robot = robot
        @options = options
      end
    end
  end
end
