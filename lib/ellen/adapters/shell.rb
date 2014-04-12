require "readline"

module Ellen
  module Adapters
    class Shell < Base
      def run
        explain
        listen
      end

      def say(body, options = {})
        puts body
      end

      private

      def explain
        puts "Type `exit` or `quit` to end the session."
      end

      def prompt
        @prompt ||= "> "
      end

      def prompt=(str)
        @prompt = str
      end

      def read
        Readline.readline(prompt, true)
      end

      def listen
        loop { step }
      rescue Interrupt
        exit
      end

      def step
        prompt
        case body = read
        when "exit", "quit"
          exit
        else
          robot.receive(body: body, source: source, command: true)
        end
      end

      def source
        "shell user"
      end
    end
  end
end
