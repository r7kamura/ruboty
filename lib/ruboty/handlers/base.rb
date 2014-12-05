module Ruboty
  module Handlers
    class Base
      class << self
        include Mem

        def inherited(child)
          Ruboty.handlers << child
        end

        def on(pattern, options = {})
          actions << Action.new(pattern, options)
        end

        def actions
          []
        end
        memoize :actions
      end

      include Env::Validatable

      attr_reader :robot

      def initialize(robot)
        @robot = robot
        validate!
      end

      def call(message, options = {})
        self.class.actions.inject(false) do |matched, action|
          matched | action.call(self, message, options)
        end
      end
    end
  end
end
