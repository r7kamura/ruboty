module Ruboty
  module Routers
    class Say < Base
      on("/say", name: "say", description: "Post message by specified parameters")

      def say(request, response)
        Ruboty::Paths::Say.new(robot, request, response).call
      end
    end
  end
end
