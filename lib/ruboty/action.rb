module Ruboty
  class Action
    def self.prefix_pattern(robot_name)
      /\A@?#{Regexp.escape(robot_name)}:?\s+/
    end

    attr_reader :options, :pattern

    def initialize(pattern, options = {})
      @pattern = pattern
      @options = options
    end

    def call(handler, message, options = {})
      if !!options[:missing] == missing? && message.match(pattern_with(handler.robot.name))
        !!handler.send(name, message)
      else
        false
      end
    end

    def all?
      !!options[:all]
    end

    def description
      options[:description] || "(no description)"
    end

    def hidden?
      !!options[:hidden]
    end

    # @note :missing action is called only when any handler doesn't match given message.
    def missing?
      !!options[:missing]
    end

    def name
      options[:name]
    end

    def <=>(action)
      pattern.to_s <=> action.pattern.to_s
    end

    private

    def pattern_with(robot_name)
      if all?
        /\A#{pattern}/
      else
        /#{self.class.prefix_pattern(robot_name)}#{pattern}/
      end
    end
  end
end
