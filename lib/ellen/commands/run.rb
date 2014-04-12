module Ellen
  module Commands
    class Run < Base
      def call
        Engine.new(options).run
      end
    end
  end
end
