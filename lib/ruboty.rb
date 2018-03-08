require "active_support/concern"
require "active_support/core_ext/module/delegation"
require "active_support/core_ext/string/inflections"
require "bundler"
require "dotenv"
require "logger"
require "mem"
require "slop"
require "webrick"

module Ruboty
  class << self
    include Mem

    def logger
      @logger ||= begin
        $stdout.sync = true
        logger = Logger.new($stdout)
        logger.level = ENV["LOG_LEVEL"] ? ENV["LOG_LEVEL"].to_i : Logger::INFO
        logger
      end
    end

    def die(message)
      logger.error("Error: #{message}")
      exit(1)
    end

    def handlers
      []
    end
    memoize :handlers

    def routers
      []
    end
    memoize :routers

    def actions
      handlers.map(&:actions).flatten.sort_by { |action| action.all? ? 1 : 0 }
    end

    def paths
      routers.map(&:paths).flatten
    end
  end
end

require "ruboty/action"
require "ruboty/actions/base"
require "ruboty/actions/help"
require "ruboty/actions/ping"
require "ruboty/actions/whoami"
require "ruboty/adapter_builder"
require "ruboty/env"
require "ruboty/env/missing_required_key_error"
require "ruboty/env/validatable"
require "ruboty/env/validation_error"
require "ruboty/adapters/base"
require "ruboty/adapters/shell"
require "ruboty/brains/base"
require "ruboty/brains/memory"
require "ruboty/command_builder"
require "ruboty/commands/base"
require "ruboty/commands/generate"
require "ruboty/commands/help"
require "ruboty/commands/run"
require "ruboty/handlers/base"
require "ruboty/message"
require "ruboty/path"
require "ruboty/paths/base"
require "ruboty/paths/help"
require "ruboty/paths/ping"
require "ruboty/paths/say"
require "ruboty/robot"
require "ruboty/routers/base"
require "ruboty/version"

if ENV["DISABLE_DEFAULT_HANDLERS"] != "1"
  require "ruboty/handlers/help"
  require "ruboty/handlers/ping"
  require "ruboty/handlers/whoami"
end

if ENV["DISABLE_DEFAULT_ROUTERS"] != "1"
  require "ruboty/routers/help"
  require "ruboty/routers/ping"
  require "ruboty/routers/say"
end
