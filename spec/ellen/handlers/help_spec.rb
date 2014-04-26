require "spec_helper"

describe Ellen::Handlers::Help do
  let(:robot) do
    Ellen::Robot.new
  end

  describe "#help" do
    it "responds to `@ellen help` and says each handler's usage" do
      robot.should_receive(:say).with(%r<ellen /help\\z/i +- Show this help message>, to: "test")
      robot.receive(body: "@ellen help", from: "test")
    end
  end
end
