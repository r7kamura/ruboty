module Ellen
  module Handlers
    class Help < Base
      on /help( me)?\z/i, name: "help", description: "Show this help message"

      def help(message)
        Ellen::Actions::Help.new(message).call
      end
    end
  end
end
