require "mem"
require "slop"

# Creates an Ellen::Command object from given arguments.
#
# Example:
#
#   builder = Ellen::CommandBuilder.new(ARGV)
#   command = builder.build
#   command.call
#
module Ellen
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
      Slop.parse(arguments, help: true) do
        on("g", "generate", "Generate a new chatterbot with ./ellen/ directory.")
      end.to_hash
    end
    memoize :options
  end
end
