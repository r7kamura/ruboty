module Ellen
  class Action
    attr_reader :block, :options, :pattern

    def initialize(pattern, options = {}, &block)
      @pattern = pattern
      @options = options
      @block = block
    end

    def call(handler, message)
      handler.robot.instance_exec(message, &block) if message.match pattern_with(handler.robot.name)
    end

    def all?
      !!options[:all]
    end

    private

    def pattern_with(name)
      if all?
        /\A#{pattern}/
      else
        /\A@?#{Regexp.escape(name)}\s*#{pattern}/
      end
    end
  end
end
