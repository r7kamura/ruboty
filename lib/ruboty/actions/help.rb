module Ruboty
  module Actions
    class Help < Base
      def call
        descriptions = filtered_descriptions
        if descriptions.empty?
          message.reply("No description matched to '#{message[:filter]}'")
        else
          message.reply(descriptions.join("\n"), code: true)
        end
      end

      private

      def filtered_descriptions
        descriptions = all_descriptions
        if message[:filter]
          descriptions.select! do |description|
            description.include?(message[:filter])
          end
        end
        descriptions
      end

      def all_descriptions
        _descriptions = Ruboty.actions.reject(&:hidden?).sort.map do |action|
          prefix = ""
          prefix << message.robot.name << " " unless  action.all?
          "#{prefix}#{action.command} - #{action.description}"
        end
      end
    end
  end
end
