module Ellen
  module Actions
    class Whoami < Base
      def call
        message.reply(message.from_name)
      end
    end
  end
end
