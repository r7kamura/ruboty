require "spec_helper"

describe Ruboty::Routers::Ping do
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
    Net::HTTP.new("localhost", ENV["RUBOTY_PORT"]).get("/ping")
  end

  describe "/ping" do
    it "returns PONG to PING" do
      expect(response.code).to eq "200"
      expect(response.body).to eq "pong"
    end
  end
end
