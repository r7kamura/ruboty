module Ellen
  class Message
    attr_reader :body, :match_data, :from, :to

    def initialize(options)
      @body = options[:body]
      @from = options[:from]
      @to = options[:to]
    end

    def match(pattern)
      @match_data = pattern.match(body)
    end

    def [](index)
      match_data[index]
    end
  end
end
