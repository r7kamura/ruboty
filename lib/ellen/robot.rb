module Ellen
  class Robot
    DEFAULT_ROBOT_NAME = "ellen"

    include Mem

    delegate :say, to: :adapter

    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      dotenv
      bundle
      setup
      validate
      adapt
    end

    def receive(attributes)
      message = Message.new(attributes)
      handlers.each do |handler|
        handler.call(message)
      end
    end

    def name
      ENV["ROBOT_NAME"] || DEFAULT_ROBOT_NAME
    end

    private

    def adapt
      adapter.run
    end

    def adapter
      AdapterBuilder.new(self, options).build
    end
    memoize :adapter

    def bundle
      Bundler.require
    end

    def dotenv
      Dotenv.load if options[:dotenv]
    end

    def setup
      load(options[:load]) if options[:load]
    end

    def handlers
      Ellen.handlers.map {|handler_class| handler_class.new(self) }
    end
    memoize :handlers

    def validate
      adapter.validate
    end
  end
end
