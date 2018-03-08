module Ruboty
  module Routers
    class Ping < Base
      on("/ping", name: "ping", description: "Return PONG to PING")

      def ping(request, response)
        Ruboty::Paths::Ping.new(robot, request, response).call
      end
    end
  end
end
