module Ellen
  module Actions
    class Ping < Base
      def call
        robot.say(returned_pong)
      end

      private

      def given_ping
        message.body[-4..-1]
      end

      def returned_pong
        given_ping.gsub(/i/i, "i" => "o", "I" => "O")
      end
    end
  end
end
