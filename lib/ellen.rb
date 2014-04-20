require "active_support/core_ext/module/delegation"
require "active_support/core_ext/string/inflections"
require "bundler"
require "dotenv"
require "mem"
require "slop"

module Ellen
  class << self
    include Mem

    def logger
      @logger ||= Ellen::Logger.new($stdout)
    end

    def die(message)
      logger.error("Error: #{message}")
      exit(1)
    end

    def adapters
      {}
    end
    memoize :adapters

    def handlers
      []
    end
    memoize :handlers
  end
end

require "ellen/action"
require "ellen/adapter_builder"
require "ellen/adapters/base"
require "ellen/adapters/shell"
require "ellen/brains/base"
require "ellen/brains/null"
require "ellen/command_builder"
require "ellen/commands/base"
require "ellen/commands/generate"
require "ellen/commands/run"
require "ellen/env"
require "ellen/handlers/base"
require "ellen/handlers/help"
require "ellen/handlers/ping"
require "ellen/logger"
require "ellen/message"
require "ellen/robot"
require "ellen/version"
