module Ellen
  module Actions
    class Help < Base
      def call
        message.reply(body, code: true)
      end

      private

      def body
        action_descriptions.join("\n")
      end

      def action_descriptions
        Ellen.actions.reject(&:hidden?).map do |action|
          prefix = ""
          prefix << message.robot.name << " " unless  action.all?
          "%-#{pattern_max_length + prefix.size}s - #{action.description}" % "#{prefix}#{action.pattern.inspect}"
        end
      end

      def pattern_max_length
        Ellen.actions.map {|action| action.pattern.inspect }.map(&:size).max
      end
    end
  end
end
