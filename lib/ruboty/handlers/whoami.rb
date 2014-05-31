module Ruboty
  module Handlers
    class Whoami < Base
      on(
        /who am i\?/i,
        name: "whoami",
        description: "Answer who you are",
      )

      def whoami(message)
        Ruboty::Actions::Whoami.new(message).call
      end
    end
  end
end
