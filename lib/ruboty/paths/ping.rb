module Ruboty
  module Paths
    class Ping < Base
      def call
        response.body = pong
      end

      private

      def pong
        "pong"
      end
    end
  end
end
