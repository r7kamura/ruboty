module Ellen
  class AdapterBuilder
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
      Ellen.adapters[name] or die
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
