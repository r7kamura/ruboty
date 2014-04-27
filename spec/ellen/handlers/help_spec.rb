require "spec_helper"

describe Ellen::Handlers::Help do
  let(:robot) do
    Ellen::Robot.new
  end

  describe "#help" do
    let(:from) do
      "alice"
    end

    let(:to) do
      "#general"
    end

    it "responds to `@ellen help` and says each handler's usage" do
      robot.should_receive(:say).with(%r<ellen /help\\z/i +- Show this help message>, from: from, to: to)
      robot.receive(body: "@ellen help", from: from, to: to)
    end
  end
end
