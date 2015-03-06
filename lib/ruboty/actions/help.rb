module Ruboty
  module Actions
    class Help < Base
      def call
        message.reply(body, code: true)
      end

      private

      def body
        descriptions = all_descriptions
        if message[:filter]
          descriptions.select! do |description|
            description.include?(message[:filter])
          end
        end
        descriptions.join("\n")
      end

      def all_descriptions
        _descriptions = Ruboty.actions.reject(&:hidden?).sort.map do |action|
          prefix = ""
          prefix << message.robot.name << " " unless  action.all?
          "#{prefix}#{action.pattern.inspect} - #{action.description}"
        end
      end
    end
  end
end
