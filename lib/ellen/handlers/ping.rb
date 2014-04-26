module Ellen
  module Handlers
    class Ping < Base
      on /ping\z/i, name: "ping", description: "Return PONG to PING"

      def ping(message)
        Ellen::Actions::Ping.new(message: message, robot: robot).call
      end
    end
  end
end
