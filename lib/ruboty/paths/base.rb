module Ruboty
  module Paths
    class Base
      attr_reader :robot, :request, :response

      def initialize(robot, request, response)
        @robot = robot
        @request = request
        @response = response
      end
    end
  end
end
