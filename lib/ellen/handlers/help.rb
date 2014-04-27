module Ellen
  module Handlers
    class Help < Base
      on /help\z/i, name: "help", description: "Show this help message"

      def help(message)
        Ellen::Actions::Help.new(message).call
      end
    end
  end
end
