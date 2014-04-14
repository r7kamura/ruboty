module Ellen
  module Handlers
    class Help < Base
      on /help\z/ do |message|
        say "You'll be okay"
      end
    end
  end
end
