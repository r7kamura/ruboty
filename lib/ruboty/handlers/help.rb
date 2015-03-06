module Ruboty
  module Handlers
    class Help < Base
      on(
        /help( me)?(?: (?<filter>.+))?\z/i,
        description: "Show this help message",
        name: "help",
      )

      def help(message)
        Ruboty::Actions::Help.new(message).call
      end
    end
  end
end
