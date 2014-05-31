module Ruboty
  module Actions
    class Ping < Base
      def call
        message.reply(pong)
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
