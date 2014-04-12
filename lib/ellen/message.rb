module Ellen
  class Message
    attr_reader :body, :source, :command

    def initialize(options)
      @body = options[:body]
      @source = options[:source]
      @command = options[:command]
    end

    def match(pattern, options = {})
      (!options[:command] || command) && pattern === body
    end
  end
end
