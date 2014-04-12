module Ellen
  class AdapterBuilder
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def build
      adapter_class.new
    end

    private

    # TODO
    def adapter_class
      Class.new do
        def run
        end
      end
    end
  end
end
