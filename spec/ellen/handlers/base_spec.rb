require "spec_helper"

describe Ruboty::Handlers::Base do
  after do
    Ruboty.handlers.pop
  end

  let(:robot) do
    Ruboty::Robot.new
  end

  let!(:handler_class) do
    Class.new(described_class) do
      on(/(\d+) \+ (\d+)/, name: "addition", all: true)

      def addition(message)
        robot.say(message[1].to_i + message[2].to_i)
      end
    end
  end

  describe ".on" do
    it "registers an action to the handler" do
      robot.should_receive(:say).with(2)
      robot.receive(body: "1 + 1")
    end
  end
end
