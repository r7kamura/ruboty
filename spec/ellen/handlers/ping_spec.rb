require "spec_helper"

describe Ellen::Handlers::Ping do
  let(:robot) do
    Ellen::Robot.new
  end

  describe "#ping" do
    let(:from) do
      "alice"
    end

    let(:to) do
      "#general"
    end

    it "returns PONG to PING" do
      robot.should_receive(:say).with(body: "pong", from: from, to: to)
      robot.receive(body: "@ellen ping", from: from, to: to)
    end
  end
end
