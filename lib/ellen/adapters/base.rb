# Abstract class to be inherited from adapter class.
#
# Example:
#
#   # Used as `ellen --adapter=my_adapter`
#   class MyAdapter < Ellen::Adapters::Base
#     def run
#       ... do your work ...
#     end
#   end
#
module Ellen
  module Adapters
    class Base
      class << self
        def inherited(child_class)
          Ellen::AdapterBuilder.adapter_classes << child_class
        end

        def env(key, description, options = {})
          envs << Env.new(key, description, options)
        end

        def envs
          @envs ||= []
        end

        def usage
          envs.map(&:to_usage).join("\n")
        end
      end

      attr_reader :robot

      def initialize(robot)
        @robot = robot
      end

      def say(body, options = {})
        Ellen.logger.info("Not implemented #{self.class}##{__method__} was called")
      end

      def validate
        self.class.envs.each(&:validate)
      rescue Env::MissingRequiredKeyError => exception
        Ellen.die("#{exception}\n#{self.class.usage}")
      end
    end
  end
end
