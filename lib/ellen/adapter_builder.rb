require "mem"

module Ellen
  class AdapterBuilder
    class << self
      include Mem

      def adapters
        {}
      end
      memoize :adapters
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
      self.class.adapters[name] or die
    end

    def name
      options[:adapter] || default_name
    end

    def default_name
      "shell"
    end

    def die
      Ellen.die("No adapter is defined for `#{name}`")
    end
  end
end
