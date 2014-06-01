module Ruboty
  class Robot
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
      handlers.each do |handler|
        handler.call(message)
      end
    end

    def name
      ENV["ROBOT_NAME"] || DEFAULT_ROBOT_NAME
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
      Bundler.require
    rescue Bundler::GemfileNotFound
    end

    def dotenv
      Dotenv.load if options[:dotenv]
    end

    def setup
      load(options[:load]) if options[:load]
    end

    def handlers
      Ruboty.handlers.map {|handler_class| handler_class.new(self) }
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
