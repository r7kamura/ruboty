module Ellen
  class Message
    attr_reader :body, :command, :match_data, :source

    def initialize(options)
      @body = options[:body]
      @source = options[:source]
      @command = options[:command]
    end

    def match(pattern)
      @match_data = pattern.match(body)
    end

    def [](index)
      match_data[index]
    end
  end
end
