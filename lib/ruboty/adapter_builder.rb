module Ruboty
  class AdapterBuilder
    def self.adapter_classes
      @adapter_classes ||= []
    end

    attr_reader :robot

    def initialize(robot)
      @robot = robot
    end

    def build
      adapter_class.new(robot)
    end

    private

    def adapter_class
      self.class.adapter_classes.last
    end
  end
end
