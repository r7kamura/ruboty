require "readline"

module Ruboty
  module Adapters
    class Shell < Base
      PROMPT = "> "

      SOURCE = "shell"

      USAGE = "Type `exit` or `quit` to end the session."

      attr_accessor :stopped

      def initialize(*args)
        super
        remember
      end

      def run
        explain
        listen
      end

      def say(message)
        puts message[:body]
      end

      private

      def explain
        Ruboty.logger.info(USAGE)
      end

      def read
        Readline.readline(PROMPT, true).tap do |line|
          history_file.puts(line)
        end
      end

      def listen
        step until stopped?
      rescue Interrupt
        stop
      end

      def step
        case body = read
        when "exit", "quit", nil
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

      def remember
        if history_pathname.exist?
          history_pathname.each_line do |line|
            Readline::HISTORY << line.rstrip
          end
        end
      end

      def history_pathname
        @history_pathname ||= Pathname.new("~/.ruboty_history").expand_path
      end

      def history_file
        @history_file ||= history_pathname.open("a").tap do |file|
          file.sync = true
        end
      end
    end
  end
end
