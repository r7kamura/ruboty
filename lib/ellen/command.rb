module Ellen
  class Command
    attr_reader :arguments

    def initialize(arguments = ARGV)
      @arguments = arguments
    end

    # TODO
    def call
      puts "#{self.class}##{__method__}"
    end
  end
end
