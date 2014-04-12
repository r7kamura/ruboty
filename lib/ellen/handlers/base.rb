# Abstract class to be inherited from handler class.
#
# Example:
#
#   class MyHandler < Ellen::Handlers::Base
#     def call(message)
#       ... do your work ...
#     end
#   end
#
module Ellen
  module Handlers
    class Base
      attr_reader :robot

      def initialize(robot)
        @robot = robot
      end
    end
  end
end
