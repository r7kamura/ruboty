module Ruboty
  module Paths
    class Say < Base
      def call
        robot.say(attributes)
      end

      private

      def attributes
        {
          body: request.query["body"],
          from: request.query["from"],
          to: request.query["to"],
        }
      end
    end
  end
end
