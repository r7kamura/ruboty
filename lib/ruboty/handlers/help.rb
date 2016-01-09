module Ruboty
  module Handlers
    class Help < Base
      on(
        /help( me)?(?: (?<filter>.+))?\z/i,
        description: "Show this help message",
        name: "help",
        command: "help (me) (<filter>)",
      )

      def help(message)
        Ruboty::Actions::Help.new(message).call
      end
    end
  end
end
