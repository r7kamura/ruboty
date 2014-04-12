module Ellen
  class Action
    attr_reader :pattern, :options, :block

    def initialize(pattern, options = {}, &block)
      @pattern = pattern
      @options = options
      @block = block
    end

    def call(handler, message)
      handler.robot.instance_exec(message, &block) if message.match(pattern, options)
    end
  end
end
