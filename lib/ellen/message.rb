module Ellen
  class Message
    attr_reader(
      :body,
      :from,
      :match_data,
      :robot,
      :to,
    )

    def initialize(options)
      @body = options[:body]
      @from = options[:from]
      @robot = options[:robot]
      @to = options[:to]
    end

    def match(pattern)
      @match_data = pattern.match(body)
    end

    def [](index)
      match_data[index]
    end

    def reply(body, options = {})
      attributes = { body: body, from: from, to: to }.merge(options)
      robot.say(attributes)
    end
  end
end
