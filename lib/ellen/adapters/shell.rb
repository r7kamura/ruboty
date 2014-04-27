require "readline"

module Ellen
  module Adapters
    class Shell < Base
      PROMPT = "> "

      SOURCE = "shell"

      USAGE = "Type `exit` or `quit` to end the session."

      attr_accessor :stopped

      def run
        explain
        listen
      end

      def say(message)
        Ellen.logger.info(message[:body])
      end

      private

      def explain
        Ellen.logger.info(USAGE)
      end

      def read
        Readline.readline(PROMPT, true)
      end

      def listen
        step until stopped?
      rescue Interrupt
        stop
      end

      def step
        case body = read
        when "exit", "quit"
          stop
        else
          robot.receive(body: body, source: SOURCE)
        end
      end

      def stopped?
        !!stopped
      end

      def stop
        self.stopped = true
      end
    end
  end
end
