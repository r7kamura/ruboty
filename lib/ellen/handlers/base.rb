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
      class << self
        def inherited(child)
          super
          Ellen.handlers << child
        end
      end

      attr_reader :robot

      def initialize(robot)
        @robot = robot
      end
    end
  end
end
