module Ruboty
  module Commands
    class Run < Base
      def call
        Robot.new(options).run
      end
    end
  end
end
