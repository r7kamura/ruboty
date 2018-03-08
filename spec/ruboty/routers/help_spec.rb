require "spec_helper"

describe Ruboty::Routers::Help do
  before do
    allow_any_instance_of(Ruboty::Robot).to receive(:server).and_call_original
    allow_any_instance_of(Ruboty::Robot).to receive(:route).and_call_original
    robot.send(:route)
  end

  after do
    robot.server.shutdown
    while !robot.server.listeners.empty? do
      sleep 1
    end
  end

  let(:robot) do
    Ruboty::Robot.new
  end

  let(:response) do
    Net::HTTP.new("localhost", ENV["RUBOTY_PORT"]).get("/help")
  end

  describe "/help" do
    let(:body) do
      <<-EOS.strip_heredoc.strip
          /help - Show this help message
          /ping - Return PONG to PING
          /say - Post message by specified parameters
        EOS
    end

    it "show each router's description" do
      expect(response.code).to eq "200"
      expect(response.body).to eq body
    end
  end
end
