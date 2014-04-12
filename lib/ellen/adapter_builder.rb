require "mem"

module Ellen
  class AdapterBuilder
    class << self
      include Mem

      def adapters
        {}
      end
      memoize :adapters
    end

    attr_reader :options

    def initialize(options)
      @options = options
    end

    def build
      adapter_class.new(options)
    end

    private

    def adapter_class
      self.class.adapters[name] or die
    end

    def name
      options[:adapter] || default_name
    end

    def default_name
      "shell"
    end

    def die
      Ellen.die("Undefined adapter for `#{name}`")
    end
  end
end
