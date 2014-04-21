module Ellen
  class Action
    attr_reader :options, :pattern

    def initialize(pattern, options = {})
      @pattern = pattern
      @options = options
    end

    def call(handler, message)
      handler.send(name, message) if message.match pattern_with(handler.robot.name)
    end

    def all?
      !!options[:all]
    end

    def description
      options[:description] || "(no description)"
    end

    def name
      options[:name]
    end

    private

    def pattern_with(name)
      if all?
        /\A#{pattern}/
      else
        /\A@?#{Regexp.escape(name)}:?\s*#{pattern}/
      end
    end
  end
end
