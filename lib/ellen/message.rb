module Ellen
  class Message
    attr_reader :body, :command, :match_data, :source

    def initialize(options)
      @body = options[:body]
      @source = options[:source]
      @command = options[:command]
    end

    def match(pattern, options = {})
      if options[:command] && !command
        false
      else
        (pattern === body).tap do
          @match_data = Regexp.last_match
        end
      end
    end

    def [](index)
      match_data[index]
    end
  end
end
