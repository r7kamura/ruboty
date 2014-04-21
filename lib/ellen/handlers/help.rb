module Ellen
  module Handlers
    class Help < Base
      on /help\z/i, name: "help", description: "Show this help message"

      def help(message)
        robot.say Ellen.actions.map {|action|
          "%-30s - #{action.description}" % "#{robot.name unless action.all?} #{action.pattern.inspect}"
        }.join("\n")
      end
    end
  end
end
