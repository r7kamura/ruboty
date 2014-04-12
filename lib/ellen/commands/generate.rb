module Ellen
  module Commands
    class Generate
      def call
        puts "#{self.class}##{__method__}"
      end
    end
  end
end
