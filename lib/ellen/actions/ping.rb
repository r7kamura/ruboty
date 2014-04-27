module Ellen
  module Actions
    class Ping < Base
      def call
        robot.say(body: pong, from: message.from, to: message.to)
      end

      private

      def ping
        message.body[-4..-1]
      end

      def pong
        ping.gsub(/i/i, "i" => "o", "I" => "O")
      end
    end
  end
end
