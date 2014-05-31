module Ruboty
  class CommandBuilder
    include Mem

    attr_reader :arguments

    def initialize(arguments = ARGV)
      @arguments = arguments
    end

    def build
      command_class.new(options)
    end

    private

    def command_class
      options[:generate] ? Commands::Generate : Commands::Run
    end

    def options
      Slop.parse!(arguments, help: true) do
        on("dotenv", "Load .env before running.")
        on("g", "generate", "Generate a new chatterbot with ./ruboty/ directory if specified.")
        on("l", "load=", "Load a ruby file before running.")
      end.to_hash
    end
    memoize :options
  end
end
