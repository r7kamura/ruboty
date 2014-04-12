module Ellen
  class Robot
    include Mem

    delegate :say, to: :adapter

    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      bundle
      setup
      adapt
    end

    def receive(attributes)
      message = Message.new(attributes)
      handlers.each do |handler|
        handler.call(message)
      end
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

    def setup
      load(options[:load]) if options[:load]
    end

    def handlers
      Ellen.handlers.map {|handler_class| handler_class.new(self) }
    end
    memoize :handlers
  end
end
