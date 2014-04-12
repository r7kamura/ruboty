# Creates a Ellen::Command object from given arguments.
#
# Example:
#
#   builder = Ellen::CommandBuilder.new(ARGV)
#   command = builder.build
#   command.call
#
module Ellen
  class CommandBuilder
    attr_reader :arguments

    def initialize(arguments = ARGV)
      @arguments = arguments
    end

    def build
      command_class.new
    end

    private

    def command_class
      case command_name
      when "generate"
        Commands::Generate
      when "run"
        Commands::Run
      else
        raise UndefinedCommandNameError, "No command is defined for: #{command_name}"
      end
    end

    def command_name
      ARGV[0]
    end

    class UndefinedCommandNameError < StandardError
    end
  end
end
