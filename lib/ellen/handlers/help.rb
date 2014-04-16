module Ellen
  module Handlers
    class Help < Base
      on /help\z/i, description: "Show this help message" do |message|
        lines = Ellen.handlers.map(&:actions).flatten.sort_by(&:all?).map do |action|
          prefix = "@#{name} " unless action.all?
          line = "%-30s - #{action.description}" % "#{prefix}#{action.pattern.inspect}"
          line
        end
        say lines.join("\n")
      end
    end
  end
end
