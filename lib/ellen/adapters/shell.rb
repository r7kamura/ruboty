require "readline"

module Ellen
  module Adapters
    class Shell < Base
      PROMPT = "> "

      attr_accessor :stopped

      def run
        explain
        listen
      end

      def say(body, options = {})
        Ellen.logger.info(body)
      end

      private

      def explain
        Ellen.logger.info("Type `exit` or `quit` to end the session.")
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
          robot.receive(body: body, source: source)
        end
      end

      def source
        "shell user"
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
