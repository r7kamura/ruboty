module Ruboty
  class Env
    attr_reader :key, :description, :options

    def initialize(key, description, options = {})
      @key = key.to_s
      @description = description
      @options = options
    end

    def validate
      error if required? && missing?
    end

    def to_usage
      "    %-30s - %s" % [key, description]
    end

    private

    def required?
      !options[:optional]
    end

    def missing?
      !ENV[key]
    end

    def error
      raise MissingRequiredKeyError, %<ENV["#{key}"] is required but missing>
    end
  end
end
