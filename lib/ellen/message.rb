module Ellen
  class Message
    attr_reader(
      :match_data,
      :original,
    )

    def initialize(original)
      @original = original
    end

    def body
      @original[:body]
    end

    def from
      @original[:from]
    end

    def robot
      @original[:robot]
    end

    def to
      @original[:to]
    end

    def match(pattern)
      @match_data = pattern.match(body)
    end

    def [](index)
      match_data[index]
    end

    def reply(body, options = {})
      attributes = { body: body, from: to, to: from, original: original }.merge(options)
      robot.say(attributes)
    end
  end
end
