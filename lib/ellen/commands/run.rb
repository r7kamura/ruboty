module Ellen
  module Commands
    class Run
      def call
        puts "#{self.class}##{__method__}"
      end
    end
  end
end
