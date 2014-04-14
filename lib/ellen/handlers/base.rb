# Abstract class to be inherited from handler class.
#
# Example:
#
#   class MyHandler < Ellen::Handlers::Base
#     on /kill\z/ do |message|
#       say "Good bye, cruel world..."
#       exit
#     end
#   end
#
module Ellen
  module Handlers
    class Base
      class << self
        include Mem

        def inherited(child)
          Ellen.handlers << child
        end

        def on(pattern, options = {}, &block)
          actions << Action.new(pattern, options, &block)
        end

        def actions
          []
        end
        memoize :actions
      end

      attr_reader :robot

      def initialize(robot)
        @robot = robot
      end

      def call(message)
        self.class.actions.each do |action|
          action.call(self, message)
        end
      end
    end
  end
end
