require "bundler"
require "mem"

module Ellen
  class Robot
    include Mem

    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      bundle
      adapt
    end

    # TODO
    def receive(message)
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
  end
end
