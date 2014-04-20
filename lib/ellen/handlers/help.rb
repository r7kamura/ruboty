module Ellen
  module Handlers
    class Help < Base
      on /help\z/i, name: "help", description: "Show this help message"

      def help(message)
        lines = Ellen.handlers.map(&:actions).flatten.sort_by(&:all?).map do |action|
          prefix = "@#{robot.name} " unless action.all?
          line = "%-30s - #{action.description}" % "#{prefix}#{action.pattern.inspect}"
          line
        end
        robot.say lines.join("\n")
      end
    end
  end
end
