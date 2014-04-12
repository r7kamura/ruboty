require "ellen/adapter_builder"
require "ellen/command_builder"
require "ellen/commands/base"
require "ellen/commands/generate"
require "ellen/commands/run"
require "ellen/adapters/base"
require "ellen/adapters/shell"
require "ellen/engine"
require "ellen/logger"
require "ellen/version"

module Ellen
  class << self
    def logger
      @logger ||= Ellen::Logger.new($stdout)
    end

    def die(message)
      logger.error("Error: #{message}")
      exit(1)
    end
  end
end
