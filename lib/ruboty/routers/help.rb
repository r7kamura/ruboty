module Ruboty
  module Routers
    class Help < Base
      on("/help", name: "help", description: "Show this help message")

      def help(request, response)
        Ruboty::Paths::Help.new(robot, request, response).call
      end
    end
  end
end
