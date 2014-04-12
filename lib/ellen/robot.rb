require "bundler"

module Ellen
  class Robot
    attr_reader :options

    def initialize(options)
      @options = options
    end

    def run
      bundle
      adapt
    end

    private

    def adapt
      adapter.run
    end

    def adapter
      AdapterBuilder.new(options).build
    end

    def bundle
      Bundler.require
    end
  end
end
