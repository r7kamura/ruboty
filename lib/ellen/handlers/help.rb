module Ellen
  module Handlers
    class Help < Base
      on /help\z/, command: true do |message|
        say "You'll be okay", destination: message.source
      end
    end
  end
end
