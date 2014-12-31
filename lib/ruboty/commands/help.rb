module Ruboty
  module Commands
    class Help < Base
      def call
        puts options
        exit
      end
    end
  end
end
