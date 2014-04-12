require "ellen/adapter_builder"
require "ellen/command_builder"
require "ellen/commands/base"
require "ellen/commands/generate"
require "ellen/commands/run"
require "ellen/engine"
require "ellen/logger"
require "ellen/version"

module Ellen
  class << self
    def logger
      @logger ||= Ellen::Logger.new($stdout)
    end
  end
end
