module Ellen
  module Handlers
    class Ping < Base
      on /ping\z/i, description: "Return PONG to PING" do |message|
        say message.body[-4..-1].gsub(/i/i, "i" => "o", "I" => "O")
      end
    end
  end
end
