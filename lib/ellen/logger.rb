require "logger"

module Ruboty
  class Logger < Logger
    def initialize(*)
      super
      @formatter = ->(severity, time, name, message) { "#{message}\n" }
    end
  end
end
