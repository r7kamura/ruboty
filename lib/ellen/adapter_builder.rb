module Ellen
  class AdapterBuilder
    def self.adapter_classes
      @adapter_classes ||= []
    end

    attr_reader :robot, :options

    def initialize(robot, options)
      @robot = robot
      @options = options
    end

    def build
      adapter_class.new(robot, options)
    end

    private

    def adapter_class
      self.class.adapter_classes.last
    end
  end
end
