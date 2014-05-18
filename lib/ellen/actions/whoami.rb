module Ellen
  module Actions
    class Whoami < Base
      def call
        message.reply(message.from)
      end
    end
  end
end
