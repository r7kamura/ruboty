module Ruboty
  class Robot
    DEFAULT_ENV = "development"
    DEFAULT_ROBOT_NAME = "ruboty"

    include Mem

    delegate :say, to: :adapter

    attr_reader :options

    def initialize(options = {})
      @options = options
    end

    def run
      dotenv
      bundle
      setup
      remember
      handle
      adapt
    end

    def receive(attributes)
      message = Message.new(attributes.merge(robot: self))
      unless handlers.inject(false) { |matched, handler| matched | handler.call(message) }
        handlers.each do |handler|
          handler.call(message, missing: true)
        end
      end
    end

    # @return [true] Because it needs to tell that an action is matched.
    undef :say
    def say(*args)
      adapter.say(*args)
      true
    end

    # ROBOT_NAME is deprecated.
    def name
      ENV["RUBOTY_NAME"] || ENV["ROBOT_NAME"] || DEFAULT_ROBOT_NAME
    end

    def brain
      Brains::Base.find_class.new
    end
    memoize :brain

    private

    def adapt
      adapter.run
    end

    def adapter
      AdapterBuilder.new(self).build
    end
    memoize :adapter

    def bundle
      ::Bundler.require(:default, env)
    rescue ::Bundler::GemfileNotFound
    end

    def env
      ENV["RUBOTY_ENV"] || DEFAULT_ENV
    end
    memoize :env

    def dotenv
      Dotenv.load if options[:dotenv]
    end

    def setup
      load(options[:load]) if options[:load]
    end

    def handlers
      Ruboty.handlers.map { |handler_class| handler_class.new(self) }
    end
    memoize :handlers

    def remember
      brain
    end

    def handle
      handlers
    end
  end
end
