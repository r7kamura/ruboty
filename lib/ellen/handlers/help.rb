module Ellen
  module Handlers
    class Help < Base
      Ellen.handlers << self

      def call(message)
        case message
        when /help\z/
          help
        end
      end

      # TODO
      def help
        puts "Not yet implemented"
      end
    end
  end
end
