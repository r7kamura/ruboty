require "ellen/command_builder"
require "ellen/commands/base"
require "ellen/commands/generate"
require "ellen/commands/run"
require "ellen/version"
require "ellen/logger"

module Ellen
  def self.logger
    @logger ||= Ellen::Logger.new($stdout)
  end
end
