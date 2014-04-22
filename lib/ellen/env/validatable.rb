module Ellen
  class Env
    module Validatable
      extend ActiveSupport::Concern

      module ClassMethods
        def envs
          @envs ||= []
        end

        def env(key, description, options = {})
          envs << Env.new(key, description, options)
        end

        def usage
          envs.map(&:to_usage).join("\n")
        end
      end

      def validate
        self.class.envs.each(&:validate)
      rescue MissingRequiredKeyError => exception
        Ellen.die("#{exception}\n#{self.class.usage}")
      end
    end
  end
end
