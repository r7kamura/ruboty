module Ellen
  module Actions
    class Help
      attr_reader :options

      def initialize(options)
        @options = options
      end

      def call
        robot.say(action_descriptions.join("\n"), from: message.from, to: message.to)
      end

      private

      def action_descriptions
        Ellen.actions.map do |action|
          prefix = ""
          prefix << robot.name << " " unless  action.all?
          "%-#{pattern_max_length + prefix.size}s - #{action.description}" % "#{prefix}#{action.pattern.inspect}"
        end
      end

      def robot
        options[:robot]
      end

      def message
        options[:message]
      end

      def pattern_max_length
        Ellen.actions.map {|action| action.pattern.inspect }.map(&:size).max
      end
    end
  end
end
